class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.includes(:user,:question).order(created_at: :desc)
  end  
end
