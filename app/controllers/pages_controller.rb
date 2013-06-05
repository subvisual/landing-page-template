class PagesController < ApplicationController
  def index
  end

  def referral
    @token = params[:token]

    User.increment_views params[:token]

    render :index
  end
end
