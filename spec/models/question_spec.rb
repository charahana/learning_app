require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'バリデーション' do
    let(:category) { Category.create(name: "テスト") }

    it '全ての項目があれば有効' do
      question = Question.new(
        question_text: "テスト問題",
        category: category
      )
      expect(question).to be_valid
    end

    it 'question_textがなければ無効' do
      question = Question.new(
        question_text: nil,
        category: category
      )
      expect(question).to be_invalid
    end

    it 'categoryがなければ無効' do
      question = Question.new(
        question_text: "テスト問題",
        category: nil
      )
      expect(question).to be_invalid
    end
  end

  describe 'アソシエーション' do
    it 'choicesを複数持つ' do
      assoc = described_class.reflect_on_association(:choices)
      expect(assoc.macro).to eq :has_many
    end

    it 'categoryに属する' do
      assoc = described_class.reflect_on_association(:category)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end