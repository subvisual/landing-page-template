class PagesController < ApplicationController
  def index
  end

  def referral
    User.find_by_token(params[:token]).try(:increment!, :referral_views)
    @token = params[:token]
    render :index
  end
end
