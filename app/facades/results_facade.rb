class ResultsFacade
  def initialize
    @geocoding ||= GeocodingService.new
    @open_weather ||= OpenWeatherService.new
    @mtn_project ||= MtnProjectService.new
  end

  def location(city_state)
    json = @geocoding.location_search(city_state)[:results][0]
    details = {
      coordinates: json[:locations][0][:latLng],
      city: json[:locations][0][:adminArea5],
      state: json[:locations][0][:adminArea3]
    }
    Location.new(details)
  end

  def get_forecast(coordinates)
    json = @open_weather.one_call(coordinates, 'minutely', 'imperial')
    Forecast.new(json)
  end

  def get_climbing_routes(coordinates)
    routes = @mtn_project.routes_for_lat_lon(coordinates)[:routes]
    routes.each do |route|
      Route.new(route)
    end
  end
end
