class CreateLieus < ActiveRecord::Migration
  def change
    create_table :lieus do |t|
      t.string :nom
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
