RSpec.describe Route do
  before :each do

    route = {
            "id": 105748786,
            "name": "The Naked Edge",
            "type": "Trad",
            "rating": "5.11b",
            "stars": 4.9,
            "starVotes": 345,
            "pitches": 6,
            "location": [
                "Colorado",
                "Boulder",
                "Eldorado Canyon SP",
                "Redgarden Wall",
                "Redgarden - Tower Two"
            ],
            "url": "https://www.mountainproject.com/route/105748786/the-naked-edge",
            "imgSqSmall": "https://cdn2.apstatic.com/photos/climb/110822565_sqsmall_1494354956.jpg",
            "imgSmall": "https://cdn2.apstatic.com/photos/climb/110822565_small_1494354956.jpg",
            "imgSmallMed": "https://cdn2.apstatic.com/photos/climb/110822565_smallMed_1494354956.jpg",
            "imgMedium": "https://cdn2.apstatic.com/photos/climb/110822565_medium_1494354956.jpg",
            "longitude": -105.2852,
            "latitude": 39.9312
        }

    @route = Route.new(route)
  end

  it 'has attributes: name, type, rating, location, and distance_to_route' do

    expect(@route.name).to eq("The Naked Edge")
    expect(@route.type).to eq("Trad")
    expect(@route.rating).to eq("5.11b")
    expect(@route.location.class).to eq(Array)
    expect(@route.location).to include("Boulder")
    # expect(@route.distance_to_route).to eq("")
  end
end
