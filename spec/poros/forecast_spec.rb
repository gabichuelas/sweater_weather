RSpec.describe Forecast do
  it 'has current, hourly, and daily attributes as well as coordinates and timezone for id purposes' do

    api_response = File.read('spec/fixtures/denver_forecast2.json')
    json = JSON.parse(api_response, symbolize_names: true)
    forecast = Forecast.new(json)

    expect(forecast.timezone).to eq("America/Denver")
    expect(forecast.coordinates).to eq({ lat: 39.74, lon: -104.98 })
    expect(forecast.current.temp).to eq(80.4)
    expect(forecast.current.sunrise).to eq(1600605971)
    expect(forecast.current.humidity).to eq(17)

    forecast.next_48_hours.each do |hour|
      expect(hour.class).to eq(Hour)
    end

    forecast.next_8_days.each do |day|
      expect(day.class).to eq(Day)
    end

    expect(forecast.next_8_days[0].rain).to eq(nil)
    expect(forecast.next_8_days[1].rain).to eq(0.44)
    expect(forecast.next_8_days.count).to eq(8)
    expect(forecast.next_48_hours.count).to eq(48)
  end
end
