class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  valitates :selected_answer, presence: true
end
