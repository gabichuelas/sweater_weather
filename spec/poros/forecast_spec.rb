RSpec.describe Forecast do
  it 'has current, hourly, and daily attributes' do

    api_response = File.read('../fixtures/denver_forecast.rb')
    require "pry"; binding.pry

    forecast = Forecast.new(api_response)
    expect(forecast.current.sunrise).to eq(1600605971)
    expect(forecast.current.temp).to eq(80.4)
    expect(forecast.daily.rain).to eq(0.44)
  end
end
