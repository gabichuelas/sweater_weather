RSpec.describe Location do

  before :each do
    details = {
      city: 'Denver',
      state: 'CO',
      coordinates: {
        lat: '39.738453',
        lng: '-104.984853'
      }
    }

    @location = Location.new(details)
  end

  it 'has attributes: city, state, coordinates' do
    expect(@location.city).to eq('Denver')
    expect(@location.state).to eq('CO')
    expect(@location.coordinates[:lat]).to eq('39.738453')
    expect(@location.coordinates[:lng]).to eq('-104.984853')
  end
end
