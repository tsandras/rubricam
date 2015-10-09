class AddAppartenancePersoToPersonnage < ActiveRecord::Migration
  def change
    add_column :personnages, :appartenance_perso, :string
    personnages = Personnage.where("clan is not null or tradition is not null")
    personnages.each do |personnage|
      if personnage.clan.present?
        personnage.appartenance_perso = personnage.clan
      end
      if personnage.tradition.present?
        personnage.appartenance_perso = personnage.tradition
      end
      personnage.save
    end
  end
end
