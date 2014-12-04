class CreateSpheres < ActiveRecord::Migration
  def change
    create_table :spheres do |t|
      t.string :name
      t.string :specialite
      t.text :description
      t.integer :niveau
      t.integer :personnage_id

      t.timestamps
    end
  end
end
