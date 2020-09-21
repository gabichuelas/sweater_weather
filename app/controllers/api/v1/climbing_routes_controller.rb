class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    climbing_route = ClimbingRoute.new(location_params[:location])
    render json: ClimbingRouteSerializer.new(climbing_route)
  end
end
