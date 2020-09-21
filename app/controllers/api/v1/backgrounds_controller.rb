class Api::V1::BackgroundsController < ApplicationController
  def show
    forecast = RESULTS.get_forecast(location_params[:location])
    weather = forecast.current.description
    keywords = "#{weather} #{location_params[:location]}"
    image = RESULTS.get_image(keywords)
    render json: ImageSerializer.new(image)
  end

  private

  RESULTS ||= ResultsFacade.new

  def location_params
    params.permit(:location)
  end
end
