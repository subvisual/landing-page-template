class User < ActiveRecord::Base
  attr_accessible :email, :name, :token

  before_create :generate_token

  def generate_token
    self.token = Digest::MD5.hexdigest self.email
  end
end
