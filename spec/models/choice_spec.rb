require 'rails_helper'

RSpec.describe Choice, type: :model do
  describe 'バリデーション' do
    let(:category) { Category.create(name: "テスト") }
    let(:question) { Question.create(question_text: "問題", category: category) }

    it '全ての項目があれば有効' do
      choice = Choice.new(
        content: "選択肢",
        is_correct: true,
        question: question
      )
      expect(choice).to be_valid
    end

    it 'contentがなければ無効' do
      choice = Choice.new(
        content: nil,
        is_correct: true,
        question: question
      )
      expect(choice).to be_invalid
    end

    it 'is_correctがなければ無効' do
      choice = Choice.new(
        content: "選択肢",
        is_correct: nil,
        question: question
      )
      expect(choice).to be_invalid
    end
  end

  describe 'アソシエーション' do
    it 'questionに属する' do
      assoc = described_class.reflect_on_association(:question)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end