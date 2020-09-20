RSpec.describe Location do
  it 'has attributes: city, state, lat, long, coordinates' do
    denver_lat = '39.738453'
    denver_long = '-104.984853'
    params = {location: 'denver,co'}
    location = Location.new(params)

    expect(location.city).to eq('Denver')
    expect(location.state).to eq('CO')
    expect(location.coordinates[:lat]).to eq(denver_lat)
    expect(location.coordinates[:long]).to eq(denver_long)
  end
end
