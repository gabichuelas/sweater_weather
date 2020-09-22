class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :time_in_seconds, :travel_time, :arrival_forecast

  attribute :travel_time do |obj|
    Time.at(obj.time_in_seconds).utc.strftime("%H:%M")
  end 
end
