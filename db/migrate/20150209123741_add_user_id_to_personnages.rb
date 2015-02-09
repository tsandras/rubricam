class AddUserIdToPersonnages < ActiveRecord::Migration
  def change
    add_column :personnages, :user_id, :integer
  end
end
