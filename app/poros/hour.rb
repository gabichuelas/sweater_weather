class Hour
  attr_reader :id, :time, :temp

  def initialize(hour_params)
    @id = hour_params[:dt]
    @time = hour_params[:dt]
    @temp = hour_params[:temp]
  end
end
