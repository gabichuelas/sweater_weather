class Api::V1::ForecastController < ApplicationController
  def show
    forecast = RESULTS.get_forecast(location_params[:location])
    render json: ForecastSerializer.new(forecast)
  end

  private

  RESULTS ||= ResultsFacade.new

  def location_params
    params.permit(:location)
  end
end
