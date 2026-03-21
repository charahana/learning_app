class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :Choice

  validates :user_id, uniqueness: { scope: :question_id }
end
