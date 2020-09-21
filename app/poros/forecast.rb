class Forecast
  def initialize(api_response)
    current ||= api_response[:current]
    hours ||= api_response[:hourly]
    days ||= api_response[:daily]

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
      day[:rain] unless day[:rain].nil?
      nil 
    end

    @daily_weather_keyword = days.map do |day|
      day[:weather][:main]
    end
  end
end
