# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seed開始..."

strategy = Category.find_or_create_by!(name: "ストラテジー")
management = Category.find_or_create_by!(name: "マネジメント")
technology = Category.find_or_create_by!(name: "テクノロジー")

def create_question(category:, text:, explanation:, choices:)
  question = Question.find_or_create_by!(question_text: text, category: category) do |q|
    q.explanation = explanation
  end

  choices.each do |choice|
    Choice.find_or_create_by!(content: choice[:content], question: question) do |c|
      c.is_correct = choice[:is_correct]
    end
  end
end

create_question(
  category: technology,
  text: "CPUの役割は？",
  explanation: "中央処理装置であり、演算や制御を行う。",
  choices: [
    { content: "記憶装置", is_correct: false },
    { content: "演算処理装置", is_correct: true },
    { content: "入力装置", is_correct: false },
    { content: "出力装置", is_correct: false }
  ]
)

create_question(
  category: technology,
  text: "RAMの特徴は？",
  explanation: "揮発性メモリであり、電源を切るとデータが消える。",
  choices: [
    { content: "不揮発性", is_correct: false },
    { content: "揮発性", is_correct: true },
    { content: "外部記憶", is_correct: false },
    { content: "永久保存", is_correct: false }
  ]
)

create_question(
  category: management,
  text: "PDCAのCは何？",
  explanation: "Check（評価）を指す。",
  choices: [
    { content: "Create", is_correct: false },
    { content: "Check", is_correct: true },
    { content: "Control", is_correct: false },
    { content: "Change", is_correct: false }
  ]
)

create_question(
  category: technology,
  text: "IPアドレスの役割は？",
  explanation: "ネットワーク上で機器を識別するための番号。",
  choices: [
    { content: "ユーザー名", is_correct: false },
    { content: "機器識別番号", is_correct: true },
    { content: "パスワード", is_correct: false },
    { content: "アプリ名", is_correct: false }
  ]
)

create_question(
  category: technology,
  text: "OSの役割は？",
  explanation: "ハードウェアとソフトウェアを管理する。",
  choices: [
    { content: "データ保存", is_correct: false },
    { content: "資源管理", is_correct: true },
    { content: "電源供給", is_correct: false },
    { content: "通信速度向上", is_correct: false }
  ]
)

create_question(
  category: strategy,
  text: "SWOT分析のSは何？",
  explanation: "Strength（強み）を意味する。",
  choices: [
    { content: "Speed", is_correct: false },
    { content: "Strength", is_correct: true },
    { content: "System", is_correct: false },
    { content: "Service", is_correct: false }
  ]
)

create_question(
  category: strategy,
  text: "市場分析で使われるフレームワークは？",
  explanation: "3C分析が有名。",
  choices: [
    { content: "3C分析", is_correct: true },
    { content: "5S", is_correct: false },
    { content: "PDCA", is_correct: false },
    { content: "OODA", is_correct: false }
  ]
)

create_question(
  category: strategy,
  text: "競争優位の要因は？",
  explanation: "他社との差別化が重要。",
  choices: [
    { content: "模倣", is_correct: false },
    { content: "差別化", is_correct: true },
    { content: "放置", is_correct: false },
    { content: "削減のみ", is_correct: false }
  ]
)

puts "Seed完了！"