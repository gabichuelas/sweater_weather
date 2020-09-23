RSpec.describe MapquestService do

  before :each do
    @mapquest = MapquestService.new
  end

  it '#location_search' do
    json = @mapquest.location_search("denver,co")
    expect(json).to include(:results)
    expect(json[:results].count).to eq(1)
    expect(json[:results][0]).to include(:locations)
    expect(json[:results][0][:locations][0]).to include(:latLng)
    expect(json[:results][0][:locations][0][:latLng].class).to eq(Hash)

  end

  it '#directions_search' do
    json = @mapquest.directions_search("denver,co", "boulder,co")
    expect(json).to include(:route)
    expect(json[:route]).to include(:time)
    expect(json[:route][:locations].count).to eq(2)
    expect(json[:route][:locations][0]).to include(:adminArea5)
    expect(json[:route][:locations][0]).to include(:adminArea3)
    expect(json[:route][:locations][1]).to include(:adminArea5)
    expect(json[:route][:locations][1]).to include(:adminArea3)
  end
end
