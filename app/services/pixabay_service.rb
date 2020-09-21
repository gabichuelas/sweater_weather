class PixabayService

  def search_images(keywords)
    response = conn.get do |req|
      req.params[:q] = keywords
      req.params[:category] = "backgrounds"
    end
    get_json(response)
  end

  private

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://pixabay.com/api/") do |req|
      req.params["key"] = ENV["PIXABAY_API_KEY"]
      req.headers["Accept"] = "application/json"
      req.headers["Content-Type"] = "application/json"
    end
  end
end
