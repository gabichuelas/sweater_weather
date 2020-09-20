class ForecastController < ApplicationController
  def show
    city_state = location_params[:location].split(',')
    location = ResultsFacade.location(city_state)
    forecast = ForecastSearch.new(location.coordinates)
    render json: ForecastSerializer.new(forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
