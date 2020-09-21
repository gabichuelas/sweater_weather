class ResultsFacade
  def initialize
    @geocoding ||= GeocodingService.new
    @open_weather ||= OpenWeatherService.new
  end

  def get_location(city_state)
    json = @geocoding.location_search(city_state)[:results][0]
    details = {
      coordinates: json[:locations][0][:latLng],
      city: json[:locations][0][:adminArea5],
      state: json[:locations][0][:adminArea3]
    }
    Location.new(details)
  end

  def get_forecast(city_state)
    coordinates = get_location(city_state).coordinates
    json = @open_weather.one_call(coordinates, 'minutely', 'imperial')
    Forecast.new(json)
  end
end
