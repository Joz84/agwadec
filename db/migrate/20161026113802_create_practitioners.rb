class CreatePractitioners < ActiveRecord::Migration[5.0]
  def change
    create_table :practitioners do |t|
      t.string :name
      t.string :speciality
      t.string :address
      t.string :city
      t.integer :zip_code

      t.timestamps
    end
  end
end
