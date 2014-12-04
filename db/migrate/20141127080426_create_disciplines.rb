class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :nom
      t.text :description
      t.integer :niveau
      t.string :nom_discipline

      t.timestamps
    end
  end
end
