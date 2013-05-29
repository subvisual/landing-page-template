class AddReferralViewsAndSubscriptionsToUser < ActiveRecord::Migration
  def change
    add_column :users, :referral_views, :integer, null: false, default: 0
    add_column :users, :referral_subscriptions, :integer, null: false, default: 0
  end
end
