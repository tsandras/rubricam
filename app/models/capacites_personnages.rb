class CapacitesPersonnages < ActiveRecord::Base
  attr_accessible :niveau, :personnage_id, :capacite_id, :specialite

  belongs_to :personnage
  belongs_to :capacite
end
