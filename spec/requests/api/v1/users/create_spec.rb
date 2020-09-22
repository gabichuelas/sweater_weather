RSpec.describe 'can create user from POST body and return unique api_key' do
  it 'POST /api/v1/users' do
    body = {
              email: "whatever@example.com",
              password: "password",
              password_confirmation: "password"
            }.to_json

    headers = { "ACCEPT" => "application/json",
                "Content-Type" => "application/json" }

    post api_v1_users_path, body: body, format: :json

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to include("application/json")
    expect(response.status).to eq(201)

    expect(json[:data][:type]).to eq('users')
    expect(json[:data][:attributes]).to include(:email)
    expect(json[:data][:attributes][:email]).to eq("whatever@example.com")

    expect(json[:data][:attributes]).to include(:api_key)
  end
end
