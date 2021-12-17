class Admin::QuestionsController < Admin::BaseController

  before_action :authenticate_user!
  before_action :find_question, only: %i[show update edit destroy]
  before_action :find_test, only: %i[new create]
  
  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_question_not_found

  def new
    @question = Question.new
  end

  def show;end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit;end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
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
