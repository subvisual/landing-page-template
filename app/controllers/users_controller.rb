class UsersController < ApplicationController
  def create
    @user = User.find_or_create_by_name_and_email name: params[:name], email: params[:email]
    if params[:token]
    end
  end
end
