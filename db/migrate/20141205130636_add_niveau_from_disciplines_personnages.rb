class AddNiveauFromDisciplinesPersonnages < ActiveRecord::Migration
  def change
    add_column :disciplines_personnages, :niveau, :integer
    add_column :disciplines_personnages, :voie, :string
  end
end
