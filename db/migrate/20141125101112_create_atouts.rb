class CreateAtouts < ActiveRecord::Migration
  def change
    create_table :atouts do |t|
      t.column :nom, :string
      t.column :description, :text
      t.column :cout, :integer
      t.column :description, :text

      t.timestamps
    end
  end
end
