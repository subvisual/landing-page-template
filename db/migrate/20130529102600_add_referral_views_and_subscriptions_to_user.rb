class AddReferralViewsAndSubscriptionsToUser < ActiveRecord::Migration
  def change
    add_column :users, :referral_views, :integer
    add_column :users, :referral_subscriptions, :integer
  end
end
