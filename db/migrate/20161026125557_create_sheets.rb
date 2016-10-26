class CreateSheets < ActiveRecord::Migration[5.0]
  def change
    create_table :sheets do |t|
      t.references :patient, foreign_key: true
      t.string :reference_number

      t.timestamps
    end
  end
end
