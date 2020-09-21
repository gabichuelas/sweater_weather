class Route
  attr_reader :name, :type, :rating, :location, :distance_to_route

  def initialize(route_params)
    @name = route_params[:name]
    @type = route_params[:type]
    @rating = route_params[:rating]
    @location = route_params[:location]
    @distance_to_route = ""
  end
end
