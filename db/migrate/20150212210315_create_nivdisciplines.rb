class CreateNivdisciplines < ActiveRecord::Migration
  def change
    create_table :nivdisciplines do |t|
      t.string :nom
      t.text :description
      t.integer :niveau

      t.timestamps
    end
  end
end
