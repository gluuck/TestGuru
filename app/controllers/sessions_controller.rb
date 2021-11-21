class SessionsController < ApplicationController

  def new
  end

  def show
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:user_request_path) || tests_path
    else
      flash.now[:alert] = 'Please enter email and password'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
