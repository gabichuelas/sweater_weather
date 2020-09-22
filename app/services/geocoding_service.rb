class GeocodingService
  include Serviceable
  
  def location_search(city_state)
    response = conn.get("geocoding/v1/address?location=#{city_state}")
    get_json(response)
  end

  def directions_search(origin, destination)
    body = {
      locations: [origin, destination]
    }
    response = conn.get("directions/v2/route") do |req|
      req.body = body.to_json
    end
    get_json(response)
  end

  private

  def conn
    url = "http://www.mapquestapi.com/"
    base_conn(url, "key", "GEOCODING_API_KEY")
  end
end
