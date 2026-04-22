class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order(created_at: :desc)
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
      redirect_to admin_question_path(@question), notice: "作成しました"
    else
      flash.now[:alert] = "作成出来ません"
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: "更新しました"
    else
      flash.now[:alert] = "更新出来ません"
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_path, notice: "削除しました"
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question_text, :explanation, :category_id, :published, choices_attributes: [:id, :content, :is_correct, :_destroy])
  end
end
