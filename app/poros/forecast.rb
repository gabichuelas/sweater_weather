class Forecast
  attr_reader :id, :timezone, :current_time,
    :current_sunrise,
    :current_sunset,
    :current_temp,
    :current_feels_like,
    :current_humidity,
    :current_visibility,
    :current_uvi,
    :next_48_hours,
    :next_8_days

  def initialize(api_response)

    current = Current.new(api_response[:current])

    @next_48_hours = api_response[:hourly].map do |hour|
      Hour.new(hour)
      # has dt and temp
    end

    @next_8_days = api_response[:daily].map do |day|
      Day.new(day)
      # has min, max, rain, weather keyword
    end

    @id = nil
    @timezone = api_response[:timezone]
    @current_time = current.time
    @current_sunrise = current.sunrise
    @current_sunset = current.sunset
    @current_temp = current.temp
    @current_feels_like = current.feels_like
    @current_humidity = current.humidity
    @current_visibility = current.visibility
    @current_uvi = current.uvi
  end
end
