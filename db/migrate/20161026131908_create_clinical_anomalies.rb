class CreateClinicalAnomalies < ActiveRecord::Migration[5.0]
  def change
    create_table :clinical_anomalies do |t|
      t.references :clinical_symptom, foreign_key: true
      t.references :first_form, foreign_key: true
      t.string :position

      t.timestamps
    end
  end
end
