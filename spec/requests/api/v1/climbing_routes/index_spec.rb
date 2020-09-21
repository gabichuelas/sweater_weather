RSpec.describe 'Can get climbing routes and forecast for given location as well as distance to each route from given location', type: :request do

  it 'GET /api/v1/climbing_routes?location=erwin,tn' do

    location = 'erwin,tn'
    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    get api_v1_climbing_routes_path({location: location}), headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")

    expect(json[:data][:type]).to eq("climbing_route")
    expect(json[:data][:attributes]).to include(:location)
    expect(json[:data][:attributes]).to include(:forecast)
    expect(json[:data][:attributes]).to include(:routes)
    expect(json[:data][:attributes][:routes].class).to eq(Array)

    json[:data][:attributes][:routes].each do |route|
      expect(route).to include(:name)
      expect(route).to include(:type)
      # expect(route).to include(:distance_to_route)
    end
  end
end
