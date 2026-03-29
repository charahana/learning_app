require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:user) { User.create(email: "test@example.com", password: "password") }
  let(:category) { Category.create(name: "テスト") }
  let(:question) { Question.create(question_text: "問題", category: category) }

  describe "GET /questions" do
    it "ログインしていればアクセスできる" do
      sign_in user
      get questions_path
      expect(response).to have_http_status(:ok)
    end

    it "未ログインだとリダイレクトされる" do
      get questions_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET /questions/:id" do
    it "詳細ページが表示される" do
      sign_in user
      get question_path(question)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /questions" do
    it "問題を作成できる" do
      sign_in user

      expect {
        post questions_path, params: {
          question: {
            question_text: "新しい問題",
            category_id: category.id
          }
        }
      }.to change(Question, :count).by(1)
    end
  end

  describe "PATCH /questions/:id" do
    it "問題を更新できる" do
      sign_in user

      patch question_path(question), params: {
        question: {
          question_text: "更新後"
        }
      }

      expect(question.reload.question_text).to eq "更新後"
    end
  end

  describe "DELETE /questions/:id" do
    it "問題を削除できる" do
      sign_in user

      expect {
        delete question_path(question)
      }.to change(Question, :count).by(-1)
    end
  end
end