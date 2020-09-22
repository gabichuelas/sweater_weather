class OpenWeatherService
  include Serviceable

  def one_call(coordinates, exclude, units)
    response = conn.get("onecall") do |req|
      req.params[:lat] = coordinates[:lat]
      req.params[:lon] = coordinates[:lng]
      req.params[:exclude] = exclude
      req.params[:units] = units
    end
    get_json(response)
  end

  private

  def conn
    url = "https://api.openweathermap.org/data/2.5/"
    base_conn(url, "appid", "OPEN_WEATHER_API_KEY")
  end
end
