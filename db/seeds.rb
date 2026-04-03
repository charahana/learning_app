# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
strategy = Category.find_or_create_by!(name: "ストラテジー")
management = Category.find_or_create_by!(name: "マネジメント")
technology = Category.find_or_create_by!(name: "テクノロジー")

question1 = Question.find_or_create_by!(
  question_text: "CPUの役割は？",
  category: technology
) do |q|
  q.explanation = "中央処理装置です"
end

Choice.find_or_create_by!(content: "記憶装置", question: question1) do |c|
  c.is_correct = false
end

Choice.find_or_create_by!(content: "演算処理装置", question: question1) do |c|
  c.is_correct = true
end

Choice.find_or_create_by!(content: "入力装置", question: question1) do |c|
  c.is_correct = false
end

Choice.find_or_create_by!(content: "出力装置", question: question1) do |c|
  c.is_correct = false
end