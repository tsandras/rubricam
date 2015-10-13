class CreateCampagnes < ActiveRecord::Migration
  def change
    create_table :campagnes do |t|
      t.string :nom
      t.text :description
      t.datetime :debut
      t.text :description_publique
      t.text :note

      t.timestamps
    end
  end
end
