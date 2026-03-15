class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
      t.integer :correct_answer
      t.text :explanation

      t.timestamps
    end
  end
end
