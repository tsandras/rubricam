class RemoveNiveauFromDiscipline < ActiveRecord::Migration
  def up
    remove_column :disciplines, :niveau
  end

  def down
    add_column :disciplines, :niveau, :integer
  end
end
