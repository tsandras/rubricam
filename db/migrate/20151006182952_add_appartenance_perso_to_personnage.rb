class AddAppartenancePersoToPersonnage < ActiveRecord::Migration
  def change
    add_column :personnages, :appartenance_perso, :string
  end
end
