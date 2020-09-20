class Location
  attr_reader :city, :state, :coordinates

  def initialize(details)
    @city = details[:city]
    @state = details[:state]
    @coordinates = details[:coordinates]
  end
end
