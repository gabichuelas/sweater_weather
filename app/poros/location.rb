class Location
  RESULTS ||= ResultsFacade.new
  attr_reader :city, :state, :coordinates
  
  def initialize(city, state)
    details = RESULTS.location_details(city, state)
    @city = details[:city]
    @state = details[:state]
    @coordinates = details[:coordinates]
  end
end
