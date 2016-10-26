class CreateClinicalSymptoms < ActiveRecord::Migration[5.0]
  def change
    create_table :clinical_symptoms do |t|
      t.string :name

      t.timestamps
    end
  end
end
