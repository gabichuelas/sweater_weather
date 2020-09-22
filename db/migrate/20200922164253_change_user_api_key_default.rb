class ChangeUserApiKeyDefault < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :api_key, :string, default: nil 
  end
end
