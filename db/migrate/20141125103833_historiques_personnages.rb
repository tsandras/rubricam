class HistoriquesPersonnages < ActiveRecord::Migration
  def change
    create_table :historiques_personnages do |t|
      t.integer :personnage_id
      t.integer :historique_id
      t.integer :niveau
    end
  end
end
