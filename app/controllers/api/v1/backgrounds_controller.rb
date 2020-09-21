class Api::V1::BackgroundsController < ApplicationController
  def show
    city = location_params[:location].split(',')[0]
    forecast = RESULTS.get_forecast(location_params[:location])
    weather = forecast.current.weather.downcase
    keywords = "#{weather}+#{city}"
    image = RESULTS.get_image(keywords)
    render status: 200, body: image.to_json and return unless image.class == Image
    render json: ImageSerializer.new(image)
  end

  private

  RESULTS ||= ResultsFacade.new

  def location_params
    params.permit(:location)
  end
end
