RSpec.describe Location do
  before :each do
    @denver_lat = '39.738453'
    @denver_long = '-104.984853'
    city = 'denver'
    state = 'co'
    @location = Location.new(city, state)
  end

  xit 'has attributes: city, state' do
    expect(@location.city).to eq('Denver')
    expect(@location.state).to eq('CO')
  end

  xit '#coordinates' do
    expect(@location.coordinates[:lat]).to eq(@denver_lat)
    expect(@location.coordinates[:lng]).to eq(@denver_long)
  end
end
