class DisciplinesNivdisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines_nivdisciplines do |t|
      t.integer :discipline_personnage_id
      t.integer :nivdiscipline_id
    end
  end
end
