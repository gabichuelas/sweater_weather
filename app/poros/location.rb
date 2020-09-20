class Location
  attr_reader :city, :state
  def initialize(location_params)
    location_array = location_params[:location].split(',')
    @city = location_array[0]
    @state = location_array[1]
    @results ||= ResultsFacade.new
  end

  def coordinates
    @results.get_coordinates(@city, @state)
    # returns hash { lat: '', lng: ''}
  end

  def formatted_location
    city = @results.get_city
    state = @results.get_state
    # returns official location from geocoding api result
    { city: city, state: state }
  end
end
