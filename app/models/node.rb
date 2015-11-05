class Node < ActiveRecord::Base
  attr_accessible :description, :dynamique, :entropique, :lieu_id, :niveau, :nom, 
    :personnage_id, :secret, :spec_dynamique, :spec_entropique, :spec_statique, :statique, :sup

  belongs_to :personnage
  belongs_to :lieu
end
