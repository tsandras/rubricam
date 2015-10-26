class AddSecretToOrganisationsPersonnages < ActiveRecord::Migration
  def change
    add_column :organisations_personnages, :secret, :boolean
  end
end
