class AddAvatarToPersonnages < ActiveRecord::Migration
  def change
    add_column :personnages, :avatar, :string
  end
end
