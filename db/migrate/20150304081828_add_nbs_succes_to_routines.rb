class AddNbsSuccesToRoutines < ActiveRecord::Migration
  def change
    add_column :routines, :nbs_succes, :integer
    add_column :routines, :nbs_quintessence, :integer
    add_column :routines, :volonte_permanente, :boolean
    add_column :routines, :effet, :text
    add_column :routines, :correspondance, :integer
    add_column :routines, :entropie, :integer
    add_column :routines, :esprit, :integer
    add_column :routines, :forces, :integer
    add_column :routines, :matiere, :integer
    add_column :routines, :prime, :integer
    add_column :routines, :psyche, :integer
    add_column :routines, :temps, :integer
    add_column :routines, :vie, :integer
    add_column :routines, :user_id, :integer
    add_column :objets, :valeur, :integer
    add_column :objets, :dynamique, :integer
    add_column :objets, :statique, :integer
    add_column :objets, :entropique, :integer
    add_column :objets, :routine_id, :integer
    add_column :objets, :user_id, :integer
    rename_column :objets, :type, :type_objet
  end
end
