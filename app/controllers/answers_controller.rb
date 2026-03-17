class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(user: current_user, question: @question, selected_answer: params[:selected_answer])
    @answer.save
    redirect_to question_path(@question), notice: "回答しました"
  end

  def index
    @answers = current_user.answers.includes(:question)
  end
end
