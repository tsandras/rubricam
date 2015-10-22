class CreateVersionComments < ActiveRecord::Migration
  def change
    create_table :version_comments do |t|
      t.integer :version
      t.integer :subversion
      t.datetime :liberation
      t.text :content
      t.text :details

      t.timestamps
    end
  end
end
