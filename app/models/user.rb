class User < ActiveRecord::Base
  attr_accessible :email, :name, :token

  validates_uniqueness_of :email, :token
  validates_presence_of :email, :token
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_validation :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
end
