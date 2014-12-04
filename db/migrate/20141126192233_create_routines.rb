class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :name
      t.text :description
      t.text :foci
      t.string :combinaison
      t.string :type

      t.timestamps
    end
  end
end
