RSpec.describe RoadTrip do
  it 'has origin, destination, arrival_forecast, and travel_time attributes' do

    api_response = File.read('spec/fixtures/trip_denver_pueblo.json')
    json = JSON.parse(api_response, symbolize_names: true)
    trip = RoadTrip.new(json)

    expect(trip.origin).to eq("Denver, CO")
    expect(trip.destination).to eq("Pueblo, CO")
    expect(trip.travel_time.class).to eq(String)
    expect(trip.travel_time).to eq("01:43")
    expect(trip.time_in_seconds.class).to eq(Integer)
    expect(trip.time_in_seconds).to eq(6237)
    expect(trip.arrival_forecast.class).to eq(Hash)
    expect(trip.arrival_forecast).to include(:temp)
    expect(trip.arrival_forecast).to include(:weather)
  end
end
