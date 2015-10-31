class AddTestToPersonnages < ActiveRecord::Migration
  def change
    add_column :personnages, :test, :boolean
  end
end
