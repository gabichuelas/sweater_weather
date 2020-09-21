class Forecast
  attr_reader :id, :timezone, :current_time,
    :current_sunrise,
    :current_sunset,
    :current_temp,
    :current_feels_like,
    :current_humidity,
    :current_visibility,
    :current_uvi,
    :hourly_temps,
    :daily_highs,
    :daily_lows,
    :daily_rain,
    :daily_weather_keywords

  def initialize(api_response)
    current ||= api_response[:current]
    hours ||= api_response[:hourly]
    days ||= api_response[:daily]

    @id = nil
    @timezone = api_response[:timezone]
    @current_time = current[:dt]
    @current_sunrise = current[:sunrise]
    @current_sunset = current[:sunset]
    @current_temp = current[:temp]
    @current_feels_like = current[:feels_like]
    @current_humidity = current[:humidity]
    @current_visibility = current[:visibility]
    @current_uvi = current[:uvi]

    @hourly_temps = hours.map do |hour|
      hour[:temp]
    end

    @daily_lows = days.map do |day|
      day[:temp][:min]
    end

    @daily_highs = days.map do |day|
      day[:temp][:max]
    end

    @daily_rain = days.map do |day|
      nil unless day[:rain]
      day[:rain]
    end

    @daily_weather_keywords = days.map do |day|
      day[:weather][0][:main]
    end
  end
end
