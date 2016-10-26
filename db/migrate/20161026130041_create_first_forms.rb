class CreateFirstForms < ActiveRecord::Migration[5.0]
  def change
    create_table :first_forms do |t|
      t.references :reading, foreign_key: true
      t.string :mammography_type
      t.string :mammography_system
      t.boolean :past_mammography
      t.date :past_mammography_date
      t.boolean :past_operation
      t.date :past_operation_date
      t.string :past_operation_reason
      t.boolean :family_history
      t.string :family_member
      t.boolean :hormonal_treatment
      t.boolean :clinical_examen_refusal
      t.boolean :normal_right
      t.boolean :normal_left
      t.boolean :abnormal_right
      t.boolean :abnormal_left
      t.boolean :technical_difficulty
      t.boolean :cad
      t.boolean :additional_impact
      t.boolean :normal_mammography
      t.boolean :echography_suspect
      t.text :echography_suspect_description
      t.boolean :abnormal_mammography_refusal
      t.string :radio_anomaly
      t.string :clinical_anomaly
      t.boolean :zoom
      t.boolean :echography
      t.boolean :cytoponction

      t.timestamps
    end
  end
end
