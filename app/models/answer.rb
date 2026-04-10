class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :choice

  validates :user_id, uniqueness: { scope: :question_id }

  def correct?
    choice.is_correct
  end
end
