class UsersController < ApplicationController
  def create
    u = User.create params[:user]
  end
end
