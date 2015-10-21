class CreatePartiesUsers < ActiveRecord::Migration
  def change
    create_table :parties_users do |t|
      t.integer :user_id
      t.integer :partie_id
    end
  end
end
