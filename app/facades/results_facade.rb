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
    start = "#{coordinates[:lat]},#{coordinates[:lng]}"
    routes = @mtn_project.routes_for_lat_lon(coordinates)[:routes]

    routes.map do |route|
      destination = "#{route[:latitude]},#{route[:longitude]}"
      distance = @geocoding.route_matrix(start, destination)[:distance]

      new_route = Route.new(route)
      new_route.distance_to_route = distance[1]
      new_route
    end
  end
end
