class DisciplinesNivdisciplines < ActiveRecord::Base
  attr_accessible :discipline_personnage_id, :nivdiscipline_id

  belongs_to :nivdisciplines
  belongs_to :discipline_personnage
end
