class CombinaisonsPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :combinaison_id

  belongs_to :personnage
  belongs_to :combinaison
end
