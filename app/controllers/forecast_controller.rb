class ForecastController < ApplicationController
  def show
    location = Location.new(location_params)
    coordinates = location.coordinates
    forecast = ForecastSearch.new(coordinates)
    render json: ForecastSerializer.new(forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
