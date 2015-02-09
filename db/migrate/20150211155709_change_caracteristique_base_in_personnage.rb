class ChangeCaracteristiqueBaseInPersonnage < ActiveRecord::Migration
  def up
    change_column :personnages, :caracteristique_base, :text
  end

  def down
    change_column :personnages, :caracteristique_base, :string
  end
end
