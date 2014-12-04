class CreateCapacites < ActiveRecord::Migration
  def change
    create_table :capacites do |t|
      t.string :nom
      t.text :description
      t.boolean :primaire

      t.timestamps
    end
  end
end
