class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, only: [:new, :create, :edit, :update, :destroy]

  def index
    @questions = Question.order(created_at: :desc).page(params[:page]).per(10)
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
      flash.now[:alert] = "作成出来ません"
      render :new
    end
  end

  def edit
    (4 - @question.choices.size).times { @question.choices.build }
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "更新しました"
    else
      flash.now[:alert] = "更新出来ません"
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to questions_path, notice: "削除しました"
    else
      redirect_to questions_path, alert: "削除出来ません"
    end
  end

  def random
    answered_ids = current_user.answers.pluck(:question_id)
    @question = Question.where.not(id: answered_ids).order("RANDOM()").first
    if @question.nil?
      @question = Question.order("RANDOM()").first
    end
    @user_answer = current_user.answers.find_by(question: @question)
    render :show
  end

  private

  def question_params
    params.require(:question).permit(:question_text, :explanation, :category_id, choices_attributes: [:id, :content, :is_correct, :_destroy])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def admin_only
    unless current_user.admin?
      redirect_to questions_path, alert: "権限がありません"
    end
  end
end
