RSpec.describe Current do
  before :each do

    api_response = File.read('spec/fixtures/denver_forecast2.json')
    json = JSON.parse(api_response, symbolize_names: true)

    @current = Current.new(json[:current])
  end

  it 'has attributes: time, weather, sunrise, sunset, temp, feels_like, humidity, visibility, uvi' do

    expect(@current.id).to eq(nil)
    expect(@current.time).to eq(1600645166)
    expect(@current.weather).to eq("Clouds")
    expect(@current.sunrise).to eq(1600605971)
    expect(@current.sunset).to eq(1600650010)
    expect(@current.temp).to eq(80.4)
    expect(@current.feels_like).to eq(72.86)
    expect(@current.humidity).to eq(17)
    expect(@current.visibility).to eq(10000)
    expect(@current.uvi).to eq(6.76)
  end
end
