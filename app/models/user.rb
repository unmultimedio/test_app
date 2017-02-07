class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true

  before_create :set_token

  def set_token
    token = generate_unique_secure_token
  end
end
