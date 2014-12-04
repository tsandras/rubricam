class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :nom
      t.text :description
      t.string :type
      t.datetime :date

      t.timestamps
    end
  end
end
