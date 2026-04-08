class ScoresController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @correct = current_user.answers.where(correct: true).count
    @total = current_user.answers.count
    @accuracy =
      if @total > 0
        (@correct.to_f / @total * 100).round(1)
      else
        0
      end
  end
end
