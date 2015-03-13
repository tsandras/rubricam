class AddNomPubliqueToPersonnages < ActiveRecord::Migration
  def change
    add_column :personnages, :nom_publique, :string
    rename_column :organisations, :type, :type_organisation
    add_column :organisations, :secret, :boolean
    add_column :organisations, :description_publique, :text
    add_column :organisations, :image_lien, :string
    rename_column :lieus, :type, :type_lieu
    add_column :lieus, :secret, :boolean
    add_column :lieus, :description_publique, :text
    add_column :lieus, :image_lien, :string
    change_column :lieus, :description, :text
  end
end
