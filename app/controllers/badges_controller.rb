class BadgesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @badges = Badge.all
    @user_badges = User.includes(:badges).where(email: current_user.email)
  end
end
