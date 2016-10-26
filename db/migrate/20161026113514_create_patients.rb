class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :maiden_name
      t.date :birth_date
      t.string :phone1
      t.string :phone2
      t.string :address
      t.string :city
      t.integer :zip_code
      t.string :health_insurance
      t.integer :social_security_number

      t.timestamps
    end
  end
end
