class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :timezone, :current, :next_8_days, :next_48_hours
end
