class DisciplinesPersonnages < ActiveRecord::Migration
  def change
    create_table :disciplines_personnages do |t|
      t.integer :personnage_id
      t.integer :discipline_id
    end
  end
end
