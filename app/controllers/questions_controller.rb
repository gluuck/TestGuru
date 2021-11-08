class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show update destroy]
  before_action :find_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_question_not_found

  def index
    @questions = @test.questions    
  end

  def new
    @test
  end

  def show
    render :show
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render :show
    else
      render json: @question.errors.full_messages
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:id, :body)
  end

  def resque_with_question_not_found
    render plain: 'Question not found' , status: 404
  end
end
