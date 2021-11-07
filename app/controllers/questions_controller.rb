class QuestionsController < ApplicationController
  before_action :find_question

  def index
    @questions = Question.last(10)
  end

  def show
    if @question
      redirect_to question_path
    else
      render plain: 'Question wasn\'t found', status: 404
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_index_path
    else
      render plain: 'Cannot create question', status: 422
    end
  end

  def destroy
    if @question
      @question.destroy
      redirect_to test_questions_path
    else
      render plain: 'Question not found' , status: 404
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:id, :body, :test)
  end
end
