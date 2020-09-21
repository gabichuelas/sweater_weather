RSpec.describe Day do
  before :each do

    day = {
        "dt": 1600624800,
        "sunrise": 1600605971,
        "sunset": 1600650010,
        "temp": {
            "day": 81.93,
            "min": 66.87,
            "max": 82.08,
            "night": 79.9,
            "eve": 82.08,
            "morn": 67.32
        },
        "feels_like": {
            "day": 75.79,
            "night": 75.22,
            "eve": 74.64,
            "morn": 60.96
        },
        "pressure": 1016,
        "humidity": 17,
        "dew_point": 33.62,
        "wind_speed": 4.76,
        "wind_deg": 197,
        "weather": [
            {
                "id": 802,
                "main": "Clouds",
                "description": "scattered clouds",
                "icon": "03d"
            }
        ],
        "clouds": 40,
        "pop": 0.04,
        "uvi": 6.76
    }

    @day = Day.new(day)
  end

  it 'has attributes: time, temp' do

    expect(@day.id).to eq(1600624800)
    expect(@day.min).to eq(66.87)
    expect(@day.max).to eq(82.08)
    expect(@day.rain).to eq(nil)
    expect(@day.weather).to eq('Clouds')
  end
end
