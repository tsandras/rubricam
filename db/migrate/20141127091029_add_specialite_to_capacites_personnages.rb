class AddSpecialiteToCapacitesPersonnages < ActiveRecord::Migration
  def change
    add_column :capacites_personnages, :specialite, :string
  end
end
