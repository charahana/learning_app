require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:user) { create(:user) }
  let(:admin) { create(:user, admin: true) }
  let(:category) { create(:category) }
  let(:question) { create(:question, category: category) }

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

  describe "POST /questions" do
    it "管理者は作成できる" do
      sign_in admin

      expect {
        post questions_path, params: {
          question: {
            question_text: "新しい問題",
            category_id: category.id
          }
        }
      }.to change(Question, :count).by(1)
    end

    it "一般ユーザーは作成できない" do
      sign_in user

      post questions_path, params: {
        question: {
          question_text: "新しい問題",
          category_id: category.id
        }
      }

      expect(response).to redirect_to(questions_path)
    end
  end
end