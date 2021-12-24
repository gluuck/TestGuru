class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[new create]

  def new
    @feedback = @user.feedbacks.new
  end

  def create
    @feedback = @user.feedbacks.new(feedback_params)
    if @feedback.save
      FeedbacksMailer.with(feedback: @feedback).send_feedback.deliver_now
      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def feedback_params
    params.require(:feedback).permit(:message)
  end
end
