class FeedbacksMailer < ApplicationMailer
  def send_feedback
    @feedback = params[:feedback]
    mail(to: Admin.all.map(&:email).first, subject: @feedback.user.email)
  end
end
