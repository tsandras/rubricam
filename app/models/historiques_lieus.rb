class HistoriquesLieus < ActiveRecord::Base
  attr_accessible :historique_id, :lieu_id, :niveau

  belongs_to :historique
  belongs_to :lieu
end
