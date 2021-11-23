class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'You don\'t have the right yet get this page' unless current_user.is_a?(Admin)
  end  
end
