class AddSecretToPersonnages < ActiveRecord::Migration
  def change
    add_column :personnages, :secret, :boolean
    add_column :personnages, :description_publique, :text
    add_column :personnages, :image_lien, :string
    add_column :routines, :secret, :boolean
    add_column :relations, :secret, :boolean
    add_column :disciplines, :secret, :boolean
    add_column :nivdisciplines, :secret, :boolean
    add_column :objets, :secret, :boolean
  end
end
