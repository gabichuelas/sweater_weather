class Route
  attr_reader :name, :type, :rating, :location

  def initialize(route_params)
    @name = route_params[:name]
    @type = route_params[:type]
    @rating = route_params[:rating]
    @location = route_params[:location]
    @coordinates = {
      lat: route_params[:latitude],
      lng: route_params[:longitude]
    }
  end
end
