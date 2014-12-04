class CreateAtouts < ActiveRecord::Migration
  def change
    create_table :atouts do |t|
      t.integer :personnage_id
      t.integer :atout_id
    end
  end
end
