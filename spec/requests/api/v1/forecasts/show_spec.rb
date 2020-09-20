RSpec.describe 'Can get forecast for given city, state in json', type: :request do
  it 'GET /api/v1/forecast?location=<city>,<state>' do

    location = 'denver,co'
    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    get api_v1_forecast_path({location: location}), headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:success)
    expect(json[:data][:type]).to eq('forecast')
    expect(json[:data][:attributes][:city]).to eq('denver')
    expect(json[:data][:attributes][:state]).to eq('co')
  end
end
