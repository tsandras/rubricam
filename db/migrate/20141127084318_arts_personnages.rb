class ArtsPersonnages < ActiveRecord::Migration
  def change
    create_table :arts_personnages do |t|
      t.integer :personnage_id
      t.integer :art_id
      t.integer :niveau
    end
  end
end
