require 'spec_helper'

describe UsersController do

  it 'creates a new user' do
    user = FactoryGirl.build :user
    get :create, name: user.name, email: user.email
    response.should be_success
  end

  it 'doesnt update referral subscriptions counter if when user already exists' do
    user = FactoryGirl.create :user
    referral = FactoryGirl.create :user
    get :create, user.attributes
    User.find(referral).referral_subscriptions.should eql referral.referral_subscriptions
  end

  it 'updates referral subscriptions counter' do
    referral =  FactoryGirl.create :user
    user = FactoryGirl.build :user
    get :create, name: user.name, email: user.email, token: referral.token
    User.find(referral).referral_subscriptions.should eql (referral.referral_subscriptions + 1)
  end

  it 'it ignores token when it is invalid' do
    user = FactoryGirl.build :user
    get :create, name: user.name, email: user.email, token: 'aa'
    response.should be_success
  end

  it 'redirects to home when email is invalid' do
    get :create, name: 'Random Name', email: "invalidemail"
    response.should redirect_to(index_url)
  end

end