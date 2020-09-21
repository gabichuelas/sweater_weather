class MtnProjectService

  def routes_for_lat_lon(coordinates)
    response = conn.get("get-routes-for-lat-lon") do |req|
      req.params[:lat] = coordinates[:lat]
      req.params[:lon] = coordinates[:lng]
      req.params[:maxResults] = "5"
    end
    get_json(response)
  end

  private

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://www.mountainproject.com/data/") do |req|
      req.params["key"] = ENV["MTN_PROJECT_API_KEY"]
      req.headers["Accept"] = "application/json"
      req.headers["Content-Type"] = "application/json"
    end
  end
end
