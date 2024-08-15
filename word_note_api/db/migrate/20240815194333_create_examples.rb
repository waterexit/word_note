class CreateExamples < ActiveRecord::Migration[7.1]
  def change
    create_table :examples do |t|
      t.references :word, null: false, foreign_key: true
      t.text :japanese
      t.text :english

      t.timestamps
    end
  end
end
