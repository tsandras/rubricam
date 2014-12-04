class CombinaisonsDisciplines < ActiveRecord::Base
  attr_accessible :combinaison_id, :discipline_id

  belongs_to :combinaison
  belongs_to :discipline
end
