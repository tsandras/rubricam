class AtoutsPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :atout_id

  belongs_to :personnage
  belongs_to :atout
end
