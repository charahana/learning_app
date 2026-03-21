class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :category, null: false, foreign_key: true
      t.text :question_text
      t.integer :correct_answer
      t.text :explanation

      t.timestamps
    end
  end
end
