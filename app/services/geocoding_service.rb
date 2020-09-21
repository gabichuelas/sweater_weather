class GeocodingService

  def location_search(city, state)
    response = conn.get("address?city=#{city}&state=#{state}")
    get_json(response)
  end

  private

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/") do |req|
      req.params["key"] = ENV["GEOCODING_API_KEY"]
      req.headers["Accept"] = "application/json"
      req.headers["Content-Type"] = "application/json"
    end
  end
end
