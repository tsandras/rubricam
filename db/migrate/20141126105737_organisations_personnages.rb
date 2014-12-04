class OrganisationsPersonnages < ActiveRecord::Migration
  def change
    create_table :organisations_personnages do |t|
      t.integer :personnage_id
      t.integer :organisation_id
      t.string :nom
      t.text :description
      t.datetime :date_debut
      t.datetime :date_fin
    end
  end
end
