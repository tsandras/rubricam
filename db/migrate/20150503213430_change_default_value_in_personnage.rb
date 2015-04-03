class ChangeDefaultValueInPersonnage < ActiveRecord::Migration
  def up
    change_column :personnages, :pnj, :boolean, :default => false
    change_column :personnages, :secret, :boolean, :default => false
  end

  def down
    change_column :personnages, :pnj, :boolean
    change_column :personnages, :secret, :boolean
  end
end
