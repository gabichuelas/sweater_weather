class Api::V1::RoadTripController < ApplicationController
  def create
    msg = "401: Unauthorized or missing API key".to_json
    user = User.find_by(api_key: trip_params[:api_key])
    render json: msg, status: 401 and return unless user
    trip = RESULTS.get_trip_info(trip_params[:origin], trip_params[:destination])
    render json: RoadTripSerializer.new(trip)
  end
end
