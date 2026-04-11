class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    answers = current_user.answers.includes(question: :category)
    @total = answers.count
    @correct = answers.select(&:correct?).count
    @accuracy = @total > 0 ? (@correct.to_f / @total * 100).round : 0
    @category_status = Category.all.map do |category|
      category_answers = answers.select { |a| a.question.category_id == category.id }
      total = category_answers.count
      correct = category_answers.count(&:correct?)
      accuracy = total > 0 ? (correct.to_f / total * 100).round : 0
      { name: category.name, total: total, correct: correct, accuracy: accuracy }
    end
    @weak_categories = @category_status.sort_by { |c| c[:accuracy] }.first(3)
    @recent_answers = answers.sort_by(&:created_at).reverse.first(5)
  end
end
