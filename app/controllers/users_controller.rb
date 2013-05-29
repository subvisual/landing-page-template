class UsersController < ApplicationController
  attr_reader :user

  def create
    if !existing_email?
      create_new_user
    end
  end

  private

  def existing_email?
    @user = User.where(email: params[:email]).first_or_initialize
    user.persisted?
  end

  def create_new_user
    user.name = params[:name]
    if user.save
      increment_referral
    else
      redirect_to homepage_path
    end
  end

  def increment_referral
    if params[:token]
      User.increment_subscriptions params[:token]
    end
  end
end
