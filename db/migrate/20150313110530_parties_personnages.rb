class PartiesPersonnages < ActiveRecord::Migration
  def change
    create_table :parties_personnages do |t|
      t.integer :personnage_id
      t.integer :partie_id
    end
  end
end
