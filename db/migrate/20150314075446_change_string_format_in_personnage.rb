class ChangeStringFormatInPersonnage < ActiveRecord::Migration
  def up
    change_column :personnages, :caracteristique_bonus, :text, :limit => nil
    change_column :personnages, :caracteristique_base, :text, :limit => nil
  end

  def down
    change_column :personnages, :caracteristique_bonus, :string, :limit => 255
    change_column :personnages, :caracteristique_base, :text, :limit => 255
  end
end
