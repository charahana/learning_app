FactoryBot.define do
  factory :question do
    question_text { "テスト問題" }
    explanation { "解説" }
    association :category
  end
end