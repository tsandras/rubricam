class CreateCampagnesUsers < ActiveRecord::Migration
  def change
    create_table :campagnes_users do |t|
      t.integer :campagne_id
      t.integer :user_id
    end
  end
end
