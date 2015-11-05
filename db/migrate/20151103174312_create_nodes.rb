class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :nom
      t.text :description
      t.text :sup
      t.integer :niveau
      t.integer :dynamique
      t.integer :statique
      t.integer :entropique
      t.string :spec_dynamique
      t.string :spec_statique
      t.string :spec_entropique
      t.integer :lieu_id
      t.integer :personnage_id
      t.boolean :secret

      t.timestamps
    end
  end
end
