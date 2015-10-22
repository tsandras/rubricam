class AddHasValidationToPersonnage < ActiveRecord::Migration
  def change
    add_column :personnages, :none_validation, :boolean
    add_column :personnages, :resonnances_publique, :boolean
  end
end
