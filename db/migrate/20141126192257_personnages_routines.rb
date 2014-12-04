class PersonnagesRoutines < ActiveRecord::Migration
  def change
    create_table :personnages_routines do |t|
      t.integer :personnage_id
      t.integer :routine_id
    end
  end
end
