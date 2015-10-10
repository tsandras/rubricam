class AddLockToPersonnage < ActiveRecord::Migration
  def change
    add_column :personnages, :lock, :boolean
  end
end
