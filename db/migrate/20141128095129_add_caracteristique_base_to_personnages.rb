class AddCaracteristiqueBaseToPersonnages < ActiveRecord::Migration
  def change
    add_column :personnages, :caracteristique_base, :string
    add_column :personnages, :caracteristique_bonus, :string
    add_column :personnages, :reste_bonus, :string
    add_column :personnages, :has_base, :boolean
    add_column :personnages, :has_bonus, :boolean
    add_column :capacites, :type_cap, :string
  end
end
