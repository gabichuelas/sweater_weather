module Serviceable
  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def base_conn(url, key_name, key_env_name)
    Faraday.new(url: url) do |req|
      req.params[key_name] = ENV[key_env_name]
      req.headers["Accept"] = "application/json"
      req.headers["Content-Type"] = "application/json"
    end
  end
end
