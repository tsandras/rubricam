class AddLockToPersonnage < ActiveRecord::Migration
  def change
    add_column :personnages, :lock, :boolean
    add_column :personnages, :trace, :text
    add_column :personnages, :appartenance_publique, :string
    add_column :personnages, :rang_publique, :string
    Personnage.all.each{|p| p.lock = false; p.save}
  end
end
