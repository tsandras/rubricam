class LieusPersonnages < ActiveRecord::Migration
  def change
    create_table :lieus_personnages do |t|
      t.integer :personnage_id
      t.integer :lieu_id
      t.string :nom
      t.text :description
    end
  end
end
