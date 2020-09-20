class ResultsFacade
  def initialize
    @geocoding ||= GeocodingService.new
    @open_weather ||= OpenWeatherService.new
  end

  def location(city_state)
    results = @geocoding.location_search(city_state[0], city_state[1])[:results][0]
    details = {
      coordinates: results[:locations][0][:latLng],
      city: results[:locations][0][:adminArea5],
      state: results[:locations][0][:adminArea3]
    }
    Location.new(details)
  end

  def get_forecast(coordinates)
  end 
end
