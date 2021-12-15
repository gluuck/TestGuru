class GistsController < ApplicationController
  
  def create
    @result = Result.find(params[:result_id])
    gist_question = GistQuestionService.new(@result.current_question).call

    if gist_question
      Gist.create!(git_pull_url: gist_question.html_url,
                   question: @result.current_question,
                   user: current_user)
      flash[:notice] = view_context.link_to('Gist', gist_question.git_pull_url, target: '_blank')
    else
      flash[:allert] = t('.failure')
    end

    redirect_to @result
  end
end
