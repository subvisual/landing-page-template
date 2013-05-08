class User < ActiveRecord::Base
  attr_accessible :email, :name, :token

  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :token, uniqueness: true, presence: true

  before_validation :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
end
