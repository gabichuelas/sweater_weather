class RouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :type, :rating, :location

end
