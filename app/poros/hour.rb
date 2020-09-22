class Hour
  attr_reader :id, :time, :temp, :description

  def initialize(hour_params)
    @id = hour_params[:dt]
    @time = hour_params[:dt]
    @temp = hour_params[:temp]
    @description = hour_params[:weather][:description]
  end
end
