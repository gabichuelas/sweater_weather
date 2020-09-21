class ResultsFacade
  def initialize
    @geocoding ||= GeocodingService.new
    @open_weather ||= OpenWeatherService.new
    @pixabay ||= PixabayService.new
  end

  def get_location(city_state)
    json = @geocoding.location_search(city_state)[:results][0]
    details = {
      coordinates: json[:locations][0][:latLng],
      city: json[:locations][0][:adminArea5],
      state: json[:locations][0][:adminArea3]
    }
    Location.new(details)
  end

  def get_forecast(city_state)
    coordinates = get_location(city_state).coordinates
    json = @open_weather.one_call(coordinates, 'minutely', 'imperial')
    Forecast.new(json)
  end

  def get_image(keywords)
    # use service to get image.
    json = @pixabay.search_images(keywords)
    require "pry"; binding.pry
    index = rand(json[:hits].count - 1)
    image_data = json[:hits][index]
  end
end
