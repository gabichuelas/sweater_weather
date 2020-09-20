class ForecastController < ApplicationController
  def show
    city_state = location_params[:location].split(',')
    location = RESULTS.location(city_state)
    forecast = RESULTS.get_forecast(location.coordinates)
    render json: ForecastSerializer.new(forecast)
  end

  private

  RESULTS ||= ResultsFacade.new

  def location_params
    params.permit(:location)
  end
end
