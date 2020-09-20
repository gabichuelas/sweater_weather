RSpec.describe Location do
  before :each do
    @denver_lat = '39.738453'
    @denver_long = '-104.984853'
    @params = {location: 'denver,co'}
    @location = Location.new(@params)

  end
  it 'has attributes: city, state' do
    expect(@location.city).to eq('denver')
    expect(@location.state).to eq('co')
  end

  xit '#coordinates' do
    expect(@location.coordinates[:lat]).to eq(denver_lat)
    expect(@location.coordinates[:long]).to eq(denver_long)
  end

  xit '#formatted_location' do
    expect(@location.formatted_location[:city]).to eq('Denver')
    expect(@location.formatted_location[:city]).to eq('CO')
  end
end
