class AddSourceToAtouts < ActiveRecord::Migration
  def change
    add_column :atouts, :source, :string
    add_column :disciplines, :source, :string
    add_column :historiques, :source, :string
    add_column :capacites, :source, :string
    add_column :nivdisciplines, :systeme, :text
    add_column :nivdisciplines, :tableau, :text
  end
end
