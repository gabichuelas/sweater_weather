class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: trip_params[:api_key])
    trip = RESULTS.get_trip_info(trip_params[:origin], trip_params[:destination])
    render json: RoadTripSerializer.new(trip) and return unless user.nil?
    render json: "401: Unauthorized or missing API key".to_json, status: 401
  end
end
