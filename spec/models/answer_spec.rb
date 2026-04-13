require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'バリデーション' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:question) { create(:question, category: category) }
    let(:choice) { create(:choice, question: question) }

    it '有効なデータであれば有効' do
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

    it '同じユーザーは同じ問題に1回しか回答できない' do
      Answer.create(user: user, question: question, choice: choice)

      answer = Answer.new(user: user, question: question, choice: choice)
      expect(answer).to be_invalid
    end
  end

  describe 'アソシエーション' do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
    it { should belong_to(:choice) }
  end
end