class ChangeTypeInRelationsOrganisations < ActiveRecord::Migration
  def up
    ros = RelationsOrganisation.all
    remove_column :relations_organisations, :to_organisation_id
    remove_column :relations_organisations, :from_organisation_id
    add_column :relations_organisations, :to_organisation_id, :integer
    add_column :relations_organisations, :from_organisation_id, :integer
    ros.each do |ro|
      ro.update_attributes(to_organisation_id: ro.to_organisation_id.to_i, from_organisation_id: ro.from_organisation_id.to_i)
    end
  end

  def down
    remove_column :relations_organisations, :to_organisation_id
    remove_column :relations_organisations, :from_organisation_id
    add_column :relations_organisations, :to_organisation_id, :string
    add_column :relations_organisations, :from_organisation_id, :string
  end
end
