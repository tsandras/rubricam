class AddDetailToHistoriquesPersonnages < ActiveRecord::Migration
  def change
    add_column :historiques_personnages, :detail, :string
    add_column :atouts_personnages, :detail, :string
    add_column :historiques, :has_detail, :boolean
    add_column :atouts, :has_detail, :boolean
  end
end
