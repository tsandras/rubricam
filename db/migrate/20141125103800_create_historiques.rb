class CreateHistoriques < ActiveRecord::Migration
  def change
    create_table :historiques do |t|
      t.string :nom
      t.text :description

      t.timestamps
    end
  end
end
