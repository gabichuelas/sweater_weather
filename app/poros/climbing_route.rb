class ClimbingRoute
  RESULTS ||= ResultsFacade.new

  def initialize(location)
    coordinates = RESULTS.location(location).coordinates
    forecast = RESULTS.get_forecast(coordinates)

    @id = "null"
    @location = location
    @forecast = {
      summary: forecast.current.weather,
      temperature: forecast.current.temp
    }
    @routes = RESULTS.get_climbing_routes(coordinates)
  end
end
