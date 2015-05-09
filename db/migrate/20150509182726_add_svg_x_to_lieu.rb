class AddSvgXToLieu < ActiveRecord::Migration
  def change
    add_column :lieus, :svg_x, :decimal, precision: 5, scale: 6
    add_column :lieus, :svg_y, :decimal, precision: 5, scale: 6
  end
end
