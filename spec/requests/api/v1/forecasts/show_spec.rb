RSpec.describe 'Can get forecast for given city, state in json', type: :request do
  it 'GET /api/v1/forecast?location=<city>,<state>' do

    location = 'denver,co'
    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    get api_v1_forecast_path({location: location}), headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response).to have_http_status(:success)
    expect(json[:data][:type]).to eq('forecast')
    expect(json[:data][:attributes]).to include(:current_sunset)
    expect(json[:data][:attributes]).to include(:current_humidity)

    expect(json[:data][:attributes]).to_not include(:current_pressure)
    expect(json[:data][:attributes]).to_not include(:hourly)

  end
end
