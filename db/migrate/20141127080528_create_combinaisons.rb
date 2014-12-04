class CreateCombinaisons < ActiveRecord::Migration
  def change
    create_table :combinaisons do |t|
      t.string :nom
      t.text :description
      t.integer :niveau

      t.timestamps
    end
  end
end
