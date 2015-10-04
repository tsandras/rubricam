class CreateObjetsRoutines < ActiveRecord::Migration
  def change
    create_table :objets_routines do |t|
      t.integer :objet_id
      t.integer :routine_id
    end
  end
end
