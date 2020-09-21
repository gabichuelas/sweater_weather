class RouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :type, :rating, :location

  attribute :distance_to_route do |obj|
    obj.coordinates
end
