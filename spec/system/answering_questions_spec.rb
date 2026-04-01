require 'rails_helper'

RSpec.describe "問題回答", type: :system do
  let(:user) { User.create(email: "test@example.com", password: "password") }
  let(:category) { Category.create(name: "テスト") }
  let(:question) { Question.create(question_text: "問題文", category: category) }

  let!(:choice1) { Choice.create(content: "選択肢1", is_correct: false, question: question) }
  let!(:choice2) { Choice.create(content: "選択肢2", is_correct: true, question: question) }

  it "ユーザーが選択肢を選んで回答できる" do
    # ログイン
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log in"

    # 問題ページへ
    visit question_path(question)

    # 選択肢を選ぶ
    choose choice2.content

    # 回答
    click_button "回答する"

    # 結果表示
    expect(page).to have_content("正解")
  end
end