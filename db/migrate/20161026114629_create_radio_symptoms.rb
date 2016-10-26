class CreateRadioSymptoms < ActiveRecord::Migration[5.0]
  def change
    create_table :radio_symptoms do |t|
      t.string :name

      t.timestamps
    end
  end
end
