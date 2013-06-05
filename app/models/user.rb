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

  def self.increment_subscriptions token
    User.where(token: token).first.try(:increment!, :referral_subscriptions)
  end

  def self.increment_views token
    User.where(token: token).first.try(:increment!, :referral_views)
  end
end
