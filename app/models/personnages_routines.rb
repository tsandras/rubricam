class PersonnagesRoutines < ActiveRecord::Base
  attr_accessible :personnage_id, :routine_id

  belongs_to :personnage
  belongs_to :routine
end
