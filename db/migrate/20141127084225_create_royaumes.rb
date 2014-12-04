class CreateRoyaumes < ActiveRecord::Migration
  def change
    create_table :royaumes do |t|
      t.string :nom
      t.text :description

      t.timestamps
    end
  end
end
