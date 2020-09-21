class GeocodingService

  def location_search(city_state)
    response = conn.get("geocoding/v1/address?location=#{city_state}")
    get_json(response)
  end

  def route_matrix(body)
    response = conn.get("directions/v2/routematrix")
    get_json(response)
  end

  private

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://www.mapquestapi.com/") do |req|
      req.params["key"] = ENV["GEOCODING_API_KEY"]
      req.headers["Accept"] = "application/json"
      req.headers["Content-Type"] = "application/json"
    end
  end
end
