class AddNiveauPhysiqueToPersonnages < ActiveRecord::Migration
  def change
    add_column :personnages, :niveau_physique, :integer
    add_column :personnages, :niveau_social, :integer
    add_column :personnages, :niveau_mental, :integer
    add_column :personnages, :niveau_magdynamique, :integer
    add_column :personnages, :niveau_magstatique, :integer
    add_column :personnages, :niveau_ressources, :integer
    add_column :personnages, :pnj, :boolean
    add_column :atouts, :type_atout, :string
    add_column :disciplines, :meta_dis, :boolean
  end
end
