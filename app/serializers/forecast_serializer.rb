class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :coordinates, :timezone, :current, :next_8_days, :next_48_hours
end
