class CreateRelationsOrganisations < ActiveRecord::Migration
  def change
    create_table :relations_organisations do |t|
      t.string :name
      t.text :description
      t.boolean :secret
      t.string :to_organisation_id
      t.string :from_organisation_id
    end
  end
end
