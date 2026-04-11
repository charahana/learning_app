class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :choices, dependent: :destroy

  accepts_nested_attributes_for :choices, allow_destroy: true

  validates :question_text, presence: true

  def correct_choice
    choice.find_by(is_correct: true)
  end
end
