FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password" }
    name { "テストユーザー" }
  end
end