RSpec.describe Forecast do
  it 'has current, hourly, and daily attributes' do

    api_response = File.read('spec/fixtures/denver_forecast2.json')
    json = JSON.parse(api_response, symbolize_names: true)
    forecast = Forecast.new(json)
    
    expect(forecast.current_sunrise).to eq(1600605971)
    expect(forecast.current_temp).to eq(80.4)

    expect(forecast.daily_rain.class).to eq(Array)
    expect(forecast.daily_rain[0]).to eq(nil)
    expect(forecast.daily_rain[1]).to eq(0.44)
    expect(forecast.daily_rain.count).to eq(8)
    expect(forecast.hourly_temps.count).to eq(48)
  end
end
