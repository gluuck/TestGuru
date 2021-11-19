# frozen_string_literal: true

class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :loged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:user_request_path] = request.path
      redirect_to root_path, alert: 'Welcome'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def loged_in?
    current_user.present?
  end
end
