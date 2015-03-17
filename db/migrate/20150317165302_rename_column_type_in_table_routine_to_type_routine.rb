class RenameColumnTypeInTableRoutineToTypeRoutine < ActiveRecord::Migration
  def up
    rename_column :routines, :type, :type_routine
  end

  def down
    rename_column :routines, :type_routine, :type
  end
end
