class RemoveRoutineIdToObjets < ActiveRecord::Migration
  def up
    remove_column :objets, :routine_id
  end

  def down
    add_column :objets, :routine_id, :integer
  end
end
