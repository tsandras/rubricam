class CombinaisonsDisciplines < ActiveRecord::Migration
  def change
    create_table :combinaisons_disciplines do |t|
      t.integer :combinaison_id
      t.integer :discipline_id
    end
  end
end
