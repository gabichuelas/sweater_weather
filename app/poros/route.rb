class Route
  attr_reader :name, :type, :rating, :location

  def initialize(route_params)
    @name = route_params[:name]
    @type = route_params[:type]
    @rating = route_params[:rating]
    @location = route_params[:location]
  end

  def distance_to_route(origin)
    # use routematrix to send body with two sets of coordinates
    # json[:distance][1] == distance
  end
end
