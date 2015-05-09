class LieusOrganisations < ActiveRecord::Migration
  def change
    create_table :lieus_organisations do |t|
      t.integer :lieu_id
      t.integer :organisation_id
      t.string :nom
      t.text :description
      t.datetime :date_debut
      t.datetime :date_fin
    end
  end
end
