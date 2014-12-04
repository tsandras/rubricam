class PersonnagesRoyaumes < ActiveRecord::Migration
  def change
    create_table :personnages_royaumes do |t|
      t.integer :personnage_id
      t.integer :royaume_id
      t.integer :niveau
    end
  end
end
