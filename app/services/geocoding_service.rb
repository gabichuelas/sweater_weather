class GeocodingService

  def location_search(city_state)
    response = conn.get("geocoding/v1/address?location=#{city_state}")
    get_json(response)
  end

  def route_matrix(start, destination)
    body = {
      "locations": [
        start, destination
      ]
    }
    response = conn.post("directions/v2/routematrix") do |req|
      req.body = body.to_json
    end
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
