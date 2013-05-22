class UsersController < ApplicationController
  def create
    @user = User.new name: params[:name], email: params[:email]
    if @user.save

    else

    end
  end
end
