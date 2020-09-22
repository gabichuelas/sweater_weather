RSpec.describe ResultsFacade do

  before :each do
    @facade = ResultsFacade.new
  end

  it 'starts with service connection attributes for mapquest, open_weather, and pixabay' do

    expect(@facade.mapquest.class).to eq(MapquestService)
    expect(@facade.open_weather.class).to eq(OpenWeatherService)
    expect(@facade.pixabay.class).to eq(PixabayService)
  end

  it '#get_coordinates' do
    VCR.use_cassette('get_coordinates') do

      expect(@facade.get_coordinates("gainesville,fl")).to eq({
            lat: 29.651958,
            lng: -82.325024
        })
    end
  end

  it '#get_forecast' do
    VCR.use_cassette('get_forecast') do

      forecast = @facade.get_forecast("gainesville,fl")
      expect(forecast.class).to eq(Forecast)
      expect(forecast.timezone).to eq("America/New_York")
    end
  end

  it '#get_image' do
    VCR.use_cassette('get_image') do

      image = @facade.get_image("denver clouds")
      expect(image.class).to eq(Image)
      expect(image.credit[:source]).to eq("pixabay.com")
      expect(image.image_url).to_not be_empty
    end
  end

  it '#get_trip_info' do
    VCR.use_cassette('get_trip_info') do

      trip = @facade.get_trip_info("gainesville,fl", "jacksonville,fl")
      expect(trip.class).to eq(RoadTrip)
      expect(trip.origin).to eq("Gainesville, FL")
      expect(trip.destination).to eq("Jacksonville, FL")
    end
  end
end
