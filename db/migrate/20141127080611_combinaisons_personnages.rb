class CombinaisonsPersonnages < ActiveRecord::Migration
  def change
    create_table :combinaisons_personnages do |t|
      t.integer :personnage_id
      t.integer :combinaison_id
    end
  end
end
