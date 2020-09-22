class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :time_in_seconds, :travel_time, :arrival_forecast
end
