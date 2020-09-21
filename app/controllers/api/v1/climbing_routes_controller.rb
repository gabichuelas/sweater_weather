class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    location = RESULTS.location(location_params[:location])
    # routes = RESULTS.get_routes(location.coordinates)
    render json: ClimbingRouteSerializer.new(route_options)
  end
end
