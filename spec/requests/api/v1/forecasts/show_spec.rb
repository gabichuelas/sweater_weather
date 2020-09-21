RSpec.describe 'Can get forecast for given city, state in json', type: :request do
  it 'GET /api/v1/forecast?location=<city>,<state>' do

    location = 'denver,co'
    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    get api_v1_forecast_path({location: location}), headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")

    expect(json[:data][:type]).to eq('forecast')
    expect(json[:data][:attributes]).to include(:current)
    expect(json[:data][:attributes]).to include(:next_8_days)
    expect(json[:data][:attributes]).to include(:next_48_hours)

    json[:data][:attributes][:next_8_days].each do |day|
      expect(day).to include(:min)
      expect(day).to include(:max)
      expect(day).to include(:rain)
      expect(day).to include(:weather)
    end

    expect(json[:data][:attributes]).to_not include(:current_pressure)
    expect(json[:data][:attributes]).to_not include(:hourly)
  end
end
