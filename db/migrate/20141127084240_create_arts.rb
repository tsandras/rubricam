class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :nom
      t.text :description

      t.timestamps
    end
  end
end
