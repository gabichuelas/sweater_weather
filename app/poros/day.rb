class Day
  attr_reader :id, :min, :max, :rain, :weather
  def initialize(day_params)
    @id = day_params[:dt]
    @min = day_params[:temp][:min]
    @max = day_params[:temp][:max]
    @rain = day_params[:rain]
    @weather = day_params[:weather][0][:main]
  end
end
