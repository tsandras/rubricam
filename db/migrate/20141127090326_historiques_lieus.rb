class HistoriquesLieus < ActiveRecord::Migration
  def change
    create_table :historiques_lieus do |t|
      t.integer :historique_id
      t.integer :lieu_id
      t.integer :niveau
    end
  end
end
