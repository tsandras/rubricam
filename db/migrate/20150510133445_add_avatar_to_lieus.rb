class AddAvatarToLieus < ActiveRecord::Migration
  def change
    add_column :lieus, :avatar, :string
    add_column :organisations, :avatar, :string
  end
end
