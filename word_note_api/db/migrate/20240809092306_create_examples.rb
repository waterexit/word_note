class CreateExamples < ActiveRecord::Migration[7.1]
  def change
    create_table :examples do |t|
      t.references :tlanslation, null: false, foreign_key: true
      t.text :english
      t.text :japanese

      t.timestamps
    end
  end
end
