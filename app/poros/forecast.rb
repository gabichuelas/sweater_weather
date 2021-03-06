class Forecast
  attr_reader :id, :coordinates, :timezone, :current, :next_8_days, :next_48_hours

  def initialize(api_response)

    @id = nil
    @coordinates = { lat: api_response[:lat], lon: api_response[:lon] }
    @timezone = api_response[:timezone]
    
    @current = Current.new(api_response[:current])

    @next_48_hours = api_response[:hourly].map do |hour|
      Hour.new(hour)
      # has dt and temp
    end

    @next_8_days = api_response[:daily].map do |day|
      Day.new(day)
      # has min, max, rain, weather keyword
    end
  end
end
