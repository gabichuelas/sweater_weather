class Api::V1::RoadTripController < ApplicationController

  def create
    trip = RESULTS.get_trip_info(params[:origin], params[:destination])
    render json: RoadTripSerializer.new(trip)
  end

end
