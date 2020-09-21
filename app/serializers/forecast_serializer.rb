class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :timezone,
    :current_time,
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
end
