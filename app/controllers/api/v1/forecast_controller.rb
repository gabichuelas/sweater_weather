class Api::V1::ForecastController < ApplicationController
  def show
    location = RESULTS.location(location_params[:location])
    forecast = RESULTS.get_forecast(location.coordinates)
    render json: ForecastSerializer.new(forecast)
  end
end
