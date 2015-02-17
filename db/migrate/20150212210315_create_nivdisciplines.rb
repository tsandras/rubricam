class CreateNivdisciplines < ActiveRecord::Migration
  def change
    create_table :nivdisciplines do |t|
      t.string :nom
      t.text :description
      t.integer :niveau
      t.string :source
      t.integer :discipline_id
      t.string :discipline_nom

      t.timestamps
    end
  end
end
