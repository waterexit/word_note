class CreateTlanslations < ActiveRecord::Migration[7.1]
  def change
    create_table :tlanslations do |t|
      t.references :word, null: false, foreign_key: true
      t.text :japanese

      t.timestamps
    end
  end
end
