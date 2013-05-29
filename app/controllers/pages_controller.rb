class PagesController < ApplicationController
  def index
  end

  def referral
    @token = params[:token]
    render :index
  end
end
