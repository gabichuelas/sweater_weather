class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :timezone
  # figure out what needs to come through from api 
end
