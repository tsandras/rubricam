class AddSvgXToLieu < ActiveRecord::Migration
  def change
    add_column :lieus, :svg_x, :decimal, precision: 8, scale: 2
    add_column :lieus, :svg_y, :decimal, precision: 8, scale: 2
  end
end
