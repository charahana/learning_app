require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'バリデーション' do
    it { should validate_presence_of(:name) }

    it 'nameが空文字なら無効' do
      category = Category.new(name: "")
      expect(category).to be_invalid
    end
  end

  describe 'アソシエーション' do
    it { should have_many(:questions) }
  end
end