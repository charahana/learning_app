class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  valitates: question_text, presence: true
  valitates: choice1, presence: true
  valitates: choice2, presence: true
  valitates: choice3, presence: true
  valitates: choice4, presence: true
  valitates: correct_answer, presence: true
end
