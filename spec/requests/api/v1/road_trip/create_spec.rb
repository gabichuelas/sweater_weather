RSpec.describe 'can return road trip information given start and end destination: travel time, and arrival forecast (temperature and description)' do
  before :each do
    @existing_user = User.create!(email: "whatever@example.com", password: "password", api_key: SecureRandom.uuid)
  end

  it 'POST /api/v1/road_trip' do

    body = {
              origin: "Denver,CO",
              destination: "Pueblo,CO",
              api_key: @existing_user.api_key
            }.to_json

    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    post api_v1_road_trip_path, params: body, headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response.status).to eq(200)

    expect(json[:data][:type]).to eq('road_trip')
    expect(json[:data][:attributes][:origin]).to eq("Denver, CO")
    expect(json[:data][:attributes][:destination]).to eq("Pueblo, CO")
    expect(json[:data][:attributes]).to include(:travel_time)
    expect(json[:data][:attributes]).to include(:arrival_forecast)
    expect(json[:data][:attributes][:arrival_forecast]).to include(:temp)
    expect(json[:data][:attributes][:arrival_forecast]).to include(:weather)
    expect(json[:data][:attributes]).to_not include(:time_in_seconds)
  end

  it 'Sad Path: unauthorized api key on POST /api/v1/road_trip' do
    body = {
              origin: "Denver,CO",
              destination: "Pueblo,CO",
              api_key: "fakeapikey"
            }.to_json

    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    post api_v1_road_trip_path, params: body, headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response.status).to eq(401)
    expect(json).to include("401: Unauthorized or missing API key")
  end
end
