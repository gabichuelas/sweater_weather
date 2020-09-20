class OpenWeatherService

  def one_call(coordinates, exclude)
    # exclude is a string with comma separated values. Use 'minutely'
    response = conn.get("onecall?#{coordinates[:lat]}&lon=#{coordinates[:lng]}&exclude=#{exclude}")
    get_json(response)
  end

  private

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.openweathermap.org/data/2.5/") do |req|
      req.params["appid"] = ENV["OPEN_WEATHER_API_KEY"]
      req.headers["Accept"] = "application/json"
      req.headers["Content-Type"] = "application/json"
    end
  end
end
