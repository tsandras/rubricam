class ChangeTypeInRelationsOrganisations < ActiveRecord::Migration
  def up
    change_column :relations_organisations, :to_organisation_id, :integer
    change_column :relations_organisations, :from_organisation_id, :integer
  end

  def down
    change_column :relations_organisations, :to_organisation_id, :string
    change_column :relations_organisations, :from_organisation_id, :string
  end
end
