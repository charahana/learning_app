RSpec.describe Category, type: :model do
    it 'nameがあれば有効' do
      category = Category.new(name: "テスト")
      expect(category).to be_valid
    end
  
    it 'nameがなければ無効' do
      category = Category.new(name: nil)
      expect(category).to be_invalid
    end
  end