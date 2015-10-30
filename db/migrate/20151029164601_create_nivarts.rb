class CreateNivarts < ActiveRecord::Migration
  def change
    create_table :nivarts do |t|
      t.integer :art_id
      t.string :art_nom
      t.string :nom
      t.integer :niveau
      t.text :description
      t.string :source
      t.text :systeme
      t.text :tableau
      t.boolean :secret

      t.timestamps
    end
    add_column :arts, :secret, :boolean
    add_column :arts, :source, :string
    add_column :arts, :attribut, :string
    add_column :royaumes, :source, :string
    add_column :royaumes, :capacites, :string
    add_column :personnages, :type_changelin, :string
  end
end
