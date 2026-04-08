class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.references :question, null: false, foreign_key: true
      t.string :content
      t.boolean :is_correct, null: false, default: false

      t.timestamps
    end
  end
end
