class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.integer :to_personnage_id
      t.integer :from_personnage_id

      t.timestamps
    end
  end
end
