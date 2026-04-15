class HomesController < ApplicationController

  def top
    return unless user_signed_in?
    answers = current_user.answers.includes(question: :category)
    @total = answers.count
    @correct = answers.count(&:correct?)
    @accuracy = @total.zero? ? 0 : (@correct.to_f / @total * 100).round
    @weak_categories = []
  end

  def about
  end
end
