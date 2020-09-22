class Api::V1::RoadTripController < ApplicationController
  def create

    trip = RESULTS.get_trip_info(trip_params[:origin], trip_params[:destination])
    render json: RoadTripSerializer.new(trip)
  end
end
