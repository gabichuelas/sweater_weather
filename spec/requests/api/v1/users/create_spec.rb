RSpec.describe 'can create user from POST body and return unique api_key' do

  before :each do
    @headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }
  end

  it 'POST /api/v1/users' do
    body = {
              email: "whatever@example.com",
              password: "password",
              password_confirmation: "password"
            }.to_json

    post api_v1_users_path, params: body, headers: @headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response.status).to eq(201)

    expect(json[:data][:type]).to eq('user')
    expect(json[:data][:attributes]).to include(:email)
    expect(json[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(json[:data][:attributes]).to_not include(:password)
    expect(json[:data][:attributes]).to_not include(:password_confirmation)
    expect(json[:data][:attributes]).to include(:api_key)
  end

  it 'Sad Path: missing field on POST /api/v1/users' do
    body = {
              email: "whatever@example.com"
            }.to_json

    post api_v1_users_path, params: body, headers: @headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response.status).to eq(401)
    expect(json).to include("Password can't be blank")
  end

  it 'Sad Path: duplicate email on POST /api/v1/users' do
    user = User.create!(email: "whatever@example.com", password: "password")

    body = {
              email: "whatever@example.com",
              password: "password",
              password_confirmation: "password"
            }.to_json

    post api_v1_users_path, params: body, headers: @headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response.status).to eq(401)
    expect(json).to include("Email has already been taken")
  end
end
