RSpec.describe 'Can get climbing routes for given location', type: :request do
  it 'GET /api/v1/climbing_routes?location=erwin,tn' do

    location = 'erwin,tn'
    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    get api_v1_climbing_routes_path({location: location}), headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
  end
end
