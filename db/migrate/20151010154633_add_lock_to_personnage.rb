class AddLockToPersonnage < ActiveRecord::Migration
  def change
    add_column :personnages, :lock, :boolean
    add_column :personnages, :trace, :text
  end
end
