require 'spec_helper'

describe PagesController do

  it 'updates the views counter when someone follows the referral' do
    user = FactoryGirl.create :user

    get :referral, token: user.token

    User.find(user).referral_views.should eql 1
  end

end
