class PersonnagesRoyaumes < ActiveRecord::Base
  attr_accessible :personnage_id, :royaume_id, :niveau

  belongs_to :personnage
  belongs_to :royaume
end
