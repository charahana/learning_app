class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.build(question: @question, choice_id: answer_params[:choice_id])
    if @answer.save
      redirect_to @question, notice: "回答しました"
    else
      redirect_to @question, alert: "回答に失敗しました"
    end
  end

  def index
    @answers = current_user.answers.includes(:question, :choice)
  end

  private

  def answer_params
    params.require(:answer).permit(:choice_id)
  end
end
