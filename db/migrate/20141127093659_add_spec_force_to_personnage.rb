class AddSpecForceToPersonnage < ActiveRecord::Migration
  def change
    add_column :personnages, :spec_force, :string
    add_column :personnages, :spec_dexterite, :string
    add_column :personnages, :spec_vigueur, :string
    add_column :personnages, :spec_charisme, :string
    add_column :personnages, :spec_manipulation, :string
    add_column :personnages, :spec_apparence, :string
    add_column :personnages, :spec_perception, :string
    add_column :personnages, :spec_intelligence, :string
    add_column :personnages, :spec_astuce, :string
    add_column :personnages, :reste_xps, :integer
    add_column :personnages, :type_perso, :string
    add_column :personnages, :nature, :string
    add_column :personnages, :attitude, :string
    add_column :personnages, :rang, :integer
    add_column :personnages, :points_sang, :integer
    add_column :personnages, :glamour, :integer
    add_column :personnages, :banalite, :integer
    add_column :personnages, :niveau_voie, :integer
    add_column :personnages, :voie, :string
    add_column :personnages, :tradition, :string
    add_column :personnages, :clan, :string
  end
end
