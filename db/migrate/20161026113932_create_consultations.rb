class CreateConsultations < ActiveRecord::Migration[5.0]
  def change
    create_table :consultations do |t|
      t.references :patient, foreign_key: true
      t.references :practitioner, foreign_key: true

      t.timestamps
    end
  end
end
