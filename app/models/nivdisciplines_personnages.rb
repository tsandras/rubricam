class NivdisciplinesPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :nivdiscipline_id

  belongs_to :nivdiscipline
  belongs_to :personnage
end
