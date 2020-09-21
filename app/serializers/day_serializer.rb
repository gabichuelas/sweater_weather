class DaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :min, :max, :rain, :weather
end
