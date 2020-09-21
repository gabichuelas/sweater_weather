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
    # :daily_highs,
    # :daily_lows,
    # :daily_rain,
    # :daily_weather_keywords

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

    # @daily_lows = days.map do |day|
    #   day[:temp][:min]
    # end
    #
    # @daily_highs = days.map do |day|
    #   day[:temp][:max]
    # end
    #
    # @daily_rain = days.map do |day|
    #   nil unless day[:rain]
    #   day[:rain]
    # end
    #
    # @daily_weather_keywords = days.map do |day|
    #   day[:weather][0][:main]
    # end
  end
end
