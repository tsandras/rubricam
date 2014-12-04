class CapacitesPersonnages < ActiveRecord::Migration
  def change
    create_table :capacites_personnages do |t|
      t.integer :personnage_id
      t.integer :capacite_id
      t.integer :niveau
    end
  end
end
