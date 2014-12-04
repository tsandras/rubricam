class CreatePersonnages < ActiveRecord::Migration

  def change
    create_table :personnages do |t|
      t.string :nom
      t.string :prenom
      t.datetime :date_naissance
      t.text :description
      t.integer :volonte
      t.text :background
      t.integer :force
      t.integer :dexterite
      t.integer :vigueur
      t.integer :charisme
      t.integer :manipulation
      t.integer :apparence
      t.integer :perception
      t.integer :intelligence
      t.integer :astuce
      t.text :paradygme
      t.integer :xps
      t.integer :bonus
      t.datetime :date_mort
      t.integer :points_conscience
      t.integer :points_maitrise
      t.integer :points_courage
      t.integer :points_dynamique
      t.integer :points_statique
      t.integer :points_entropique
      t.integer :entelechie

      t.timestamps
    end
  end
end
