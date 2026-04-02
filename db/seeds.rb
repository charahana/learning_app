# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: "ストラテジー")
Category.create(name: "マネジメント")
Category.create(name: "テクノロジー")

category = Category.create!(name: "テクノロジ")

question = Question.create!(
  question_text: "CPUの役割は？",
  category: category,
  explanation: "中央処理装置です"
)

Choice.create!([
  { content: "記憶装置", is_correct: false, question: question },
  { content: "演算処理装置", is_correct: true, question: question },
  { content: "入力装置", is_correct: false, question: question },
  { content: "出力装置", is_correct: false, question: question }
])