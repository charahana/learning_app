class ScoresController < ApplicationController
  before_action :authenticate_user!
  
  def show
    answers = current_user.answers.joins(:question)
    @total = answers.count
    @corrent = answers.where("selected_answer = questions.correct_answer").count
    @accuracy =
      if @total > 0
        (@correct.to_f / @total * 100.round(1))
      else
        0
      end
  end
end
