class ResultsFacade
  def initialize
    @geocoding ||= GeocodingService.new
    @open_weather ||= OpenWeatherService.new
  end

  def location(city_state)
    @geocoding.location_search(city_state[:city], city_state[:state])
    # extract city, state, coordinates
    # make new instance of Location to return to controller
    Location.new(details)
  end

end
