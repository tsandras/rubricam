class AddNiveauToCombinaisonsDisciplines < ActiveRecord::Migration
  def change
    add_column :combinaisons_disciplines, :niveau, :integer
    add_column :combinaisons, :user_id, :integer
    add_column :combinaisons, :secret, :boolean
    rename_column :combinaisons, :niveau, :cout
  end
end
