require 'spec_helper'

describe UsersController do

  it 'saves a new user' do
    user = build :user
    User.stub_chain(:where, :first_or_initialize).and_return(user)

    user.should_receive(:save)

    get :create, name: user.name, email: user.email
  end

  it 'doesnt update referral subscriptions counter when user already exists' do
    user = create :user
    referral = create :user
    User.stub_chain(:where, :first_or_initialize).and_return(user)

    referral.should_not_receive(:increment!)

    get :create, name: user.name, email: user.email, token: referral.token
  end

  it 'updates referral subscriptions counter' do
    referral = create :user
    user = build :user
    controller.stub(:user).and_return(user)
    controller.stub(:existing_email?).and_return(false)

    User.should_receive(:increment_subscriptions).and_return(true)

    get :create, name: user.name, email: user.email, token: referral.token
  end

  it 'it ignores the token if it is invalid' do
    user = build :user

    get :create, name: user.name, email: user.email, token: 'aa'

    response.should_not redirect_to(home_path)
  end

  it 'redirects to home when email is invalid' do
    get :create, name: 'Random Name', email: "invalidemail"

    response.should redirect_to(home_path)
  end

end
