RSpec.describe 'Can fetch a background image for given location', type: :request do
  it 'GET /api/v1/backgrounds?location=<city>,<state>' do

    location = 'denver,co'
    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    get api_v1_backgrounds_path({location: location}), headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")

    expect(json[:data][:type]).to eq('image')
    expect(json[:data][:attributes]).to include(:tags)
    expect(json[:data][:attributes]).to include(:image_url)
    expect(json[:data][:attributes][:image_url]).to include("https://pixabay.com")
    expect(json[:data][:attributes]).to include(:credit)
  end

  it 'can return 404 if no image results found' do
    location = 'yellervile'

    get api_v1_backgrounds_path({location: location})

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response.status).to eq(200)
    expect(json).to eq([])
  end
end
