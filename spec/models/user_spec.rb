RSpec.describe User do
  validates :email, uniqueness: true, presence: true
  validates :password, require: true

  has_secure_password
end
