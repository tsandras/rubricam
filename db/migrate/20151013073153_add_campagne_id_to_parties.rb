class AddCampagneIdToParties < ActiveRecord::Migration
  def change
    add_column :parties, :campagne_id, :integer
  end
end
