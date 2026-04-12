require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'バリデーション' do
    let(:category) { create(:category) }

    it '有効なデータであれば有効' do
      question = Question.new(
        question_text: "テスト問題",
        category: category
      )
      expect(question).to be_valid
    end

    it 'question_textがなければ無効' do
      question = Question.new(question_text: nil, category: category)
      question.valid?
      expect(question.errors[:question_text]).to be_present
    end

    it 'categoryがなければ無効' do
      question = Question.new(question_text: "テスト", category: nil)
      question.valid?
      expect(question.errors[:category]).to be_present
    end
  end

  describe 'アソシエーション' do
    it { should have_many(:choices) }
    it { should belong_to(:category) }
  end
end