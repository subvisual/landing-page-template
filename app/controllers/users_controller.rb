class UsersController < ApplicationController

  def create
    @user = User.find_or_initialize_by_email params[:email]
    @user.name = params[:name]
    if @user.persisted? || @user.save
      User.find_by_token(params[:token]).try(:increment_subscriptions!) if params[:token]
    else
      redirect_to index_path
    end
  end

end
