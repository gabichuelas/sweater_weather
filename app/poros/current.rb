class Current
  attr_reader :id,
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
