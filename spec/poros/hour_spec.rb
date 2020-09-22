RSpec.describe Hour do
  before :each do

    hour = {
        "dt": 1600642800,
        "temp": 80.4,
        "feels_like": 72.25,
        "pressure": 1020,
        "humidity": 17,
        "dew_point": 31.69,
        "clouds": 75,
        "visibility": 10000,
        "wind_speed": 8.03,
        "wind_deg": 359,
        "weather": [
            {
                "id": 803,
                "main": "Clouds",
                "description": "broken clouds",
                "icon": "04d"
            }
        ],
        "pop": 0
    }

    @hour = Hour.new(hour)
  end

  it 'has attributes: time, temp' do

    expect(@hour.id).to eq(1600642800)
    expect(@hour.time).to eq(1600642800)
    expect(@hour.temp).to eq(80.4)
    expect(@hour.description).to eq("broken clouds")
  end
end
