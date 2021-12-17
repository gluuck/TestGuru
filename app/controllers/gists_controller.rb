class GistsController < ApplicationController
  
  def create
    @result = Result.find(params[:result_id])
    gist_question = GistQuestionService.new.call(@result.current_question)

    if gist_question.success?
      Gist.create!(git_pull_url: gist_question.html_url,
                   question: @result.current_question,
                   user: current_user)
      flash[:notice] =  view_context.link_to(t('.success'), gist_question.html_url, target: '_blank')
    else
      flash[:allert] = t('.failure')
    end

    redirect_to @result
  end
end
