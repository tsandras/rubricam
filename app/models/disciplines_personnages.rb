class DisciplinesPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :discipline_id

  belongs_to :personnage
  belongs_to :discipline
end
