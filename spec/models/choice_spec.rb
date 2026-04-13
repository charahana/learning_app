require 'rails_helper'

RSpec.describe Choice, type: :model do
  describe 'バリデーション' do
    let(:question) { create(:question) }

    it '有効なデータであれば有効' do
      choice = Choice.new(
        content: "選択肢",
        is_correct: true,
        question: question
      )
      expect(choice).to be_valid
    end

    it 'contentがなければ無効' do
      choice = Choice.new(content: nil, is_correct: true, question: question)
      expect(choice).to be_invalid
    end

    it 'contentが空なら無効' do
      choice = Choice.new(content: "", is_correct: true, question: question)
      expect(choice).to be_invalid
    end

    it 'is_correctがnilなら無効' do
      choice = Choice.new(content: "選択肢", is_correct: nil, question: question)
      expect(choice).to be_invalid
    end
  end

  describe 'アソシエーション' do
    it { should belong_to(:question) }
  end
end