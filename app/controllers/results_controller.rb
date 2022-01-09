class ResultsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  before_action :set_result, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    @result.accept!(params[:answer_ids])
    if @result.completed?
      if @result.test_full_completed?
        badges = BadgeServiseToUser.new(@result).add_badge_to_user

        flash[:notice] = t('.success') 
      end
      TestsMailer.completed_test(@result).deliver_now
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
