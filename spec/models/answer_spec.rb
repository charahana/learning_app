require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'バリデーション' do
    let(:user) { User.create(email: "test@example.com", password: "password") }
    let(:category) { Category.create(name: "テスト") }
    let(:question) { Question.create(question_text: "問題", category: category) }
    let(:choice) { Choice.create(content: "選択肢", is_correct: true, question: question) }

    it '全ての項目があれば有効' do
      answer = Answer.new(user: user, question: question, choice: choice)
      expect(answer).to be_valid
    end

    it 'userがなければ無効' do
      answer = Answer.new(user: nil, question: question, choice: choice)
      expect(answer).to be_invalid
    end

    it 'questionがなければ無効' do
      answer = Answer.new(user: user, question: nil, choice: choice)
      expect(answer).to be_invalid
    end

    it 'choiceがなければ無効' do
      answer = Answer.new(user: user, question: question, choice: nil)
      expect(answer).to be_invalid
    end
  end

  describe 'アソシエーション' do
    it 'userに属する' do
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'questionに属する' do
      assoc = described_class.reflect_on_association(:question)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'choiceに属する' do
      assoc = described_class.reflect_on_association(:choice)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end