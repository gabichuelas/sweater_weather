class ResultsFacade
  def initialize
    @geocoding ||= GeocodingService.new
    @open_weather ||= OpenWeatherService.new
  end

  def location_details(city, state)
    @geocoding.location_search(city, state)
  end

end
