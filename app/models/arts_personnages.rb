class ArtsPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :art_id, :niveau

  belongs_to :personnage
  belongs_to :art
end
