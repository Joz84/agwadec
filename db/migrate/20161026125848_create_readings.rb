class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.references :user, foreign_key: true
      t.references :sheet, foreign_key: true

      t.timestamps
    end
  end
end
