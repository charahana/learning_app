FactoryBot.define do
  factory :choice do
    content { "選択肢" }
    is_correct { true }
    association :question
  end
end