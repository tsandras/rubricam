class NivdisciplinesPersonnages < ActiveRecord::Migration
  def change
    create_table :nivdisciplines_personnages do |t|
      t.integer :personnage_id
      t.integer :nivdiscipline_id
    end
  end
end
