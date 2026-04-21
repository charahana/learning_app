require 'rails_helper'

RSpec.describe "Answers", type: :request do
  let(:user) do
    User.create!(
      email: "test@example.com",
      password: "password",
      name: "テストユーザー"
    )
  end

  let(:other_user) do
    User.create!(
      email: "other@example.com",
      password: "password",
      name: "他ユーザー"
    )
  end

  let(:category) do
    Category.create!(name: "テスト")
  end

  let(:question) do
    Question.create!(question_text: "問題", category: category)
  end

  let(:my_choice) do
    Choice.create!(
      content: "自分の選択肢",
      is_correct: true,
      question: question
    )
  end

  let(:other_choice) do
    Choice.create!(
      content: "他人の選択肢",
      is_correct: true,
      question: question
    )
  end

  describe "GET /answers" do
    it "自分の回答だけ取得できる" do
      sign_in user

      Answer.create!(
        user: user,
        question: question,
        choice: my_choice
      )

      Answer.create!(
        user: other_user,
        question: question,
        choice: other_choice
      )

      get answers_path

      expect(response.body).to include("自分の選択肢")
      expect(response.body).not_to include("他人の選択肢")
    end
  end

  describe "POST /questions/:question_id/answers" do
    it "ログインしていれば回答できる" do
      sign_in user

      expect {
        post question_answers_path(question), params: {
          answer: { choice_id: my_choice.id }
        }
      }.to change(Answer, :count).by(1)
    end

    it "未ログインだとリダイレクトされる" do
      post question_answers_path(question), params: {
        answer: { choice_id: my_choice.id }
      }

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end