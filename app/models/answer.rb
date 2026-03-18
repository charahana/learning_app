class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :selected_answer, presence: true
end
