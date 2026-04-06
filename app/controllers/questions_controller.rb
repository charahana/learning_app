class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
    4.times { @question.choices.build }
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: "作成しました"
    else
      render :new
    end
  end

  def edit
    (4 - @question.choices.size).times { @question.choices.build }
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:question_text, :explanation)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
