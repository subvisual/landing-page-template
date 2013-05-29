class User < ActiveRecord::Base
  attr_accessible :email, :name, :token, 
    :referral_views, :referral_subscriptions

  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :token, uniqueness: true, presence: true
  validates :referral_views, presence: true
  validates :referral_subscriptions, presence: true

  before_validation :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  def increment_views
    self.referral_views += 1
    self
  end

  def increment_views!
    self.increment_views.save
  end

  def increment_subscriptions
    self.referral_subscriptions += 1
    self
  end
  
  def increment_subscriptions!
    self.increment_subscriptions.save
  end

end
