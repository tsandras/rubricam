class CreatePersonnages < ActiveRecord::Migration
  def change
    create_table :atouts_personnages do |t|
      t.integer :personnage_id
      t.integer :atout_id
    end
  end
end
