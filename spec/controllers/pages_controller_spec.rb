require 'spec_helper'

describe PagesController do

  it 'updates the views counter when someone follows the referral' do
    user = build :user

    User.should_receive(:increment_views)

    get :referral, token: user.token
  end

end
