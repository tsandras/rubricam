class CreateObjets < ActiveRecord::Migration
  def change
    create_table :objets do |t|
      t.string :name
      t.text :description
      t.integer :niveau
      t.string :type
      t.string :resonnance
      t.integer :personnage_id

      t.timestamps
    end
  end
end
