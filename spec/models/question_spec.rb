require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'バリデーション' do
    it 'question_textがあれば有効' do
      question = Question.new(question_text: "テスト問題")
      expect(question).to be_valid
    end

    it 'question_textがなければ無効' do
      question = Question.new(question_text: nil)
      expect(question).to be_invalid
    end

    it 'category_idがなければ無効' do
      question = Question.new(category_id: nil)
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