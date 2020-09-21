RSpec.describe Current do
  before :each do
    json = {:lat=>39.74,
     :lon=>-104.98,
     :timezone=>"America/Denver",
     :timezone_offset=>-21600,
     :current=>
      {:dt=>1600695758,
       :sunrise=>1600692427,
       :sunset=>1600736311,
       :temp=>52.65,
       :feels_like=>46.2,
       :pressure=>1024,
       :humidity=>66,
       :dew_point=>41.63,
       :uvi=>6.87,
       :clouds=>20,
       :visibility=>10000,
       :wind_speed=>8.05,
       :wind_deg=>220,
       :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}}

    @current = Current.new(json)
  end

  it 'has attributes: time, sunrise, sunset, temp, feels_like, humidity, visibility, uvi' do

    expect(@current.id).to eq(nil)
    expect(@current.time).to eq(52.65)
    expect(@current.sunrise).to eq(1600692427)
    expect(@current.sunset).to eq(1600736311)
    expect(@current.temp).to eq(1600736311)
    expect(@current.feels_like).to eq(46.2)
    expect(@current.humidity).to eq(66)
    expect(@current.visibility).to eq(10000)
    expect(@current.uvi).to eq(6.87)
  end
end
