class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def show
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash_notice
      render :new
    end
  end

  def destroy
    # session.destroy
    reset_session
    redirect_to root_path
  end
end
