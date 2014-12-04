class HistoriquesPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :historique_id, :niveau

  belongs_to :personnage
  belongs_to :historique
end
