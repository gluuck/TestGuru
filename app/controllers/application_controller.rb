# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_user_permit, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : root_path
  end

  def default_url_options
    I18n.default_locale == I18n.locale ? {} : {lang: I18n.locale}
  end
  

  private

  def set_user_permit
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:locale] : I18n.default_locale
  end
  
end
