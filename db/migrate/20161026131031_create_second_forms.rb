class CreateSecondForms < ActiveRecord::Migration[5.0]
  def change
    create_table :second_forms do |t|
      t.references :reading, foreign_key: true
      t.boolean :layout_type
      t.boolean :insufficient_layout
      t.boolean :layout_position
      t.boolean :layout_quality
      t.boolean :mammography_quality
      t.boolean :layout_reprint
      t.boolean :other
      t.string :layout_description
      t.boolean :recommended_profil
      t.boolean :recommended_localisatio
      t.boolean :recommended_layout
      t.boolean :recoomended_zoom
      t.boolean :recommended_echo
      t.text :recommendation_description

      t.timestamps
    end
  end
end
