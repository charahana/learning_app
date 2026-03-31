require 'rails_helper'

RSpec.describe "Answers", type: :request do
  let(:user) { User.create(email: "test@example.com", password: "password") }
  let(:other_user) { User.create(email: "other@example.com", password: "password") }

  let(:category) { Category.create(name: "テスト") }
  let(:question) { Question.create(question_text: "問題", category: category) }
  let(:choice) { Choice.create(content: "選択肢", is_correct: true, question: question) }

  describe "POST /questions/:question_id/answers" do
    it "ログインしていれば回答できる" do
      sign_in user

      expect {
        post question_answers_path(question), params: {
          answer: { choice_id: choice.id }
        }
      }.to change(Answer, :count).by(1)
    end

    it "未ログインだとリダイレクトされる" do
      post question_answers_path(question), params: {
        answer: { choice_id: choice.id }
      }

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET /answers" do
    it "自分の回答だけ取得できる" do
      sign_in user

      # 自分の回答
      my_answer = Answer.create(user: user, question: question, choice: choice)

      # 他人の回答
      other_answer = Answer.create(user: other_user, question: question, choice: choice)

      get answers_path

      expect(response.body).to include(my_answer.choice.content)
      expect(response.body).not_to include(other_answer.choice.content)
    end
  end
end