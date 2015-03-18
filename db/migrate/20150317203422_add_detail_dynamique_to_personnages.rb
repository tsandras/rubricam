class AddDetailDynamiqueToPersonnages < ActiveRecord::Migration
  def change
    add_column :personnages, :detail_dynamique, :string
    add_column :personnages, :detail_statique, :string
    add_column :personnages, :detail_entropique, :string
  end
end
