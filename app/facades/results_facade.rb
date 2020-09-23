class ResultsFacade
  attr_reader :mapquest, :open_weather, :pixabay

  def initialize
    @mapquest ||= MapquestService.new
    @open_weather ||= OpenWeatherService.new
    @pixabay ||= PixabayService.new
  end

  def get_coordinates(city_state)
    json = @mapquest.location_search(city_state)[:results][0]
    json[:locations][0][:latLng]
  end

  def get_forecast(city_state)
    coordinates = get_coordinates(city_state)
    json = @open_weather.one_call(coordinates, 'minutely', 'imperial')
    Forecast.new(json)
  end

  def get_image(keywords)
    json = @pixabay.search_images(keywords)
    if json[:hits].count > 1
      index = rand(json[:hits].count - 1)
    elsif json[:hits].count == 1
      index = 0
    else
      return []
    end
    image_data = json[:hits][index]
    Image.new(image_data)
  end

  def get_trip_info(origin, destination)
    json = @mapquest.directions_search(origin, destination)
    trip = RoadTrip.new(json)
    hour_index = trip.time_in_seconds.fdiv(3600).round(0) - 1
    forecast = get_forecast(destination)
    # check if hour_index is <= 47, if not:
    # hour_index / 12 - 1 == day_index, must be <= 7
    # use next_8_days[day_index]
    temp = forecast.next_48_hours[hour_index].temp
    weather = forecast.next_48_hours[hour_index].description
    trip.arrival_forecast[:temp] = temp
    trip.arrival_forecast[:weather] = weather
    trip
  end
end
