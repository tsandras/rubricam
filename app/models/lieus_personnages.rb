class LieusPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :organisation_id, :nom, :description, :date_debut, :date_fin

  belongs_to :personnage
  belongs_to :lieu
end
