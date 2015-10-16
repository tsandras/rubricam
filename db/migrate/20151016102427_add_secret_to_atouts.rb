class AddSecretToAtouts < ActiveRecord::Migration
  def change
    add_column :atouts, :secret, :boolean
  end
end
