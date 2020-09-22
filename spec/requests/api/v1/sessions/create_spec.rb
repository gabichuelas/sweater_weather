RSpec.describe 'can \'login\' user from POST body and return user with api_key' do
  before :each do
    @existing_user = User.create!(email: "whatever@example.com", password: "password", api_key: SecureRandom.uuid)
  end

  it 'POST /api/v1/sessions' do

    body = {
              email: "whatever@example.com",
              password: "password"
            }.to_json

    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    post api_v1_users_path, params: body, headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response.status).to eq(200)

    expect(json[:data][:type]).to eq('user')
    expect(json[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(json[:data][:attributes]).to_not include(:password)
    expect(json[:data][:attributes][:api_key]).to eq(@existing_user.api_key)
  end

  xit 'Sad Path: bad credentials on POST /api/v1/sessions' do
    body = {
              email: "whatever@example.com",
              password: "wrongpass"
            }.to_json

    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    post api_v1_users_path, params: body, headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response.status).to eq(403)
    expect(json).to include("Bad credentials")
  end
end
