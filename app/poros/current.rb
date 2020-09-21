class Current
  attr_reader :id,
    :weather,
    :time,
    :sunrise,
    :sunset,
    :temp,
    :feels_like,
    :humidity,
    :visibility,
    :uvi

  def initialize(api_current)
    @id = nil
    @weather = api_current[:weather][0][:description]
    @time = api_current[:dt]
    @sunrise = api_current[:sunrise]
    @sunset = api_current[:sunset]
    @temp = api_current[:temp]
    @feels_like = api_current[:feels_like]
    @humidity = api_current[:humidity]
    @visibility = api_current[:visibility]
    @uvi = api_current[:uvi]
  end
end
