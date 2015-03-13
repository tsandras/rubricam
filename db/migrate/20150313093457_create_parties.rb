class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.datetime :date
      t.integer :duree
      t.string :nom
      t.text :description
      t.text :description_publique
      t.boolean :secret
      t.string :image_lien
      t.integer :xps
      t.text :notes

      t.timestamps
    end
  end
end
