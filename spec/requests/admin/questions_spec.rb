require 'rails_helper'

RSpec.describe "Admin::Questions", type: :request do
  let(:admin) do
    User.create!(
      email: "admin@example.com",
      password: "password",
      name: "管理者",
      admin: true
    )
  end

  let(:user) do
    User.create!(
      email: "user@example.com",
      password: "password",
      name: "一般ユーザー",
      admin: false
    )
  end

  let(:category) { Category.create!(name: "テストカテゴリ") }

  let(:question) do
    Question.create!(
      question_text: "テスト問題",
      category: category
    )
  end

  describe "GET /admin/questions" do
    it "管理者はアクセスできる" do
      sign_in admin
      get admin_questions_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("問題一覧")
    end

    it "一般ユーザーはリダイレクトされる" do
      sign_in user
      get admin_questions_path
      expect(response).to redirect_to(root_path)
    end

    it "未ログインはリダイレクトされる" do
      get admin_questions_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "POST /admin/questions" do
    let(:valid_params) do
      {
        question: {
          question_text: "新しい問題",
          category_id: category.id,
          choices_attributes: [
            { content: "A", is_correct: true },
            { content: "B", is_correct: false }
          ]
        }
      }
    end

    it "管理者は作成できる" do
      sign_in admin

      expect {
        post admin_questions_path, params: valid_params
      }.to change(Question, :count).by(1)

      expect(response).to redirect_to(admin_question_path(Question.last))
    end

    it "一般ユーザーは作成できない" do
      sign_in user

      expect {
        post admin_questions_path, params: valid_params
      }.not_to change(Question, :count)

      expect(response).to redirect_to(root_path)
    end
  end

  describe "PATCH /admin/questions/:id" do
    it "管理者は更新できる" do
      sign_in admin

      patch admin_question_path(question), params: {
        question: { question_text: "更新後" }
      }

      expect(question.reload.question_text).to eq("更新後")
      expect(response).to redirect_to(admin_question_path(question))
    end
  end

  describe "DELETE /admin/questions/:id" do
    it "管理者は削除できる" do
      sign_in admin
      question

      expect {
        delete admin_question_path(question)
      }.to change(Question, :count).by(-1)

      expect(response).to redirect_to(admin_questions_path)
    end

    it "一般ユーザーは削除できない" do
      sign_in user
      question

      expect {
        delete admin_question_path(question)
      }.not_to change(Question, :count)

      expect(response).to redirect_to(root_path)
    end
  end
end