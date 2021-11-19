module SessionsHelper
  def flash_notice
    flash.now[:alert] = 'Please enter email and password'
  end
end
