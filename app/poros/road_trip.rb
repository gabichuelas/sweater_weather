class RoadTrip
  attr_reader :id, :origin, :destination, :travel_time, :time_in_seconds
  attr_accessor :arrival_forecast
  def initialize(trip_params)
    @id = nil
    locations = trip_params[:route][:locations]
    @origin = "#{locations[0][:adminArea5]}, #{locations[0][:adminArea3]}"
    @destination = "#{locations[1][:adminArea5]}, #{locations[1][:adminArea3]}"
    @time_in_seconds = trip_params[:route][:time]
    @travel_time = Time.at(@time_in_seconds).utc.strftime("%H:%M")
    @arrival_forecast = {}
  end
end
