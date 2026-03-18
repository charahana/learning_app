class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy

  validates :question_text, presence: true
  validates :choice1, presence: true
  validates :choice2, presence: true
  validates :choice3, presence: true
  validates :choice4, presence: true
  validates :correct_answer, presence: true
end
