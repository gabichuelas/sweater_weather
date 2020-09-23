RSpec.describe OpenWeatherService do

  before :each do
    @open_weather = OpenWeatherService.new
    @coordinates = {
          lat: 29.651958,
          lng: -82.325024
      }
  end

  it '#one_call' do
    json = @open_weather.one_call(@coordinates, "minutely", "imperial" )
    expect(json).to include(:timezone)
    expect(json).to include(:current)
    expect(json).to include(:hourly)
    expect(json).to include(:daily)

    expect(json[:current]).to include(:weather)
    expect(json[:current][:weather].count).to eq(1)
    expect(json[:current][:weather][0]).to include(:main)
    expect(json[:current][:weather][0]).to include(:description)
    expect(json[:current]).to include(:dt)
    expect(json[:current]).to include(:sunrise)
    expect(json[:current]).to include(:sunset)
    expect(json[:current]).to include(:temp)
    expect(json[:current][:temp].class).to eq(Float)
    expect(json[:current]).to include(:feels_like)
    expect(json[:current]).to include(:humidity)
    expect(json[:current]).to include(:visibility)
    expect(json[:current]).to include(:uvi)

    json[:hourly].each do |hour|
      expect(hour).to include(:dt)
      expect(hour).to include(:temp)
      expect(hour).to include(:weather)
      expect(hour[:weather].count).to eq(1)
      expect(hour[:weather][0]).to include(:description)
      expect(hour[:weather][0][:description].class).to eq(String)
    end

    json[:daily].each do |day|
      expect(day).to include(:dt)
      expect(day).to include(:temp)
      # expect(day).to include(:rain)
      # some entries don't include rain.
      expect(day).to include(:weather)
      expect(day[:weather].count).to eq(1)
      expect(day[:weather][0]).to include(:main)
    end
  end
end
