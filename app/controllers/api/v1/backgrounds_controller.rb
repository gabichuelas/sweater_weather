class Api::V1::BackgroundsController < ApplicationController
  def show
    city = location_params[:location].split(',')[0]
    forecast = RESULTS.get_forecast(location_params[:location])
    weather = forecast.current.weather.downcase
    keywords = "#{weather}+#{city}"
    image = RESULTS.get_image(keywords)
    msg = "No results found".to_json
    render json: msg, status: 200 and return unless image.class == Image
    render json: ImageSerializer.new(image), status: 200
  end
end
