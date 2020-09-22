class Api::V1::RoadTripController < ApplicationController
  def create
    trip = RESULTS.get_trip_info(trip_params)
    render json: RoadTripSerializer.new(trip)
  end
end
