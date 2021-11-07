class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_question_not_found

  def index
    @questions = Question.last(10)
  end

  def new
    @question = Question.new
  end

  def show
    if @question.persisted?
      @question
    else
      render plain: 'Question wasn\'t found', status: 404
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render json: @question.errors.full_messages 
    end
  end

  def destroy
    if  @question.destroy
      redirect_to test_questions_path
    else
      render json: @question.errors.full_messages   
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:id, :body, :test_id)
  end

  def resque_with_question_not_found
    render plain: 'Question not found' , status: 404
  end
end
