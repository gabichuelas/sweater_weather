class Api::V1::ForecastController < ApplicationController
  def show
    forecast = RESULTS.get_forecast(location_params)
    render json: ForecastSerializer.new(forecast)
  end
end
