class Objet < ActiveRecord::Base
  attr_accessible :description, :name, :niveau, :personnage_id, :resonnance, :type

  belongs_to :personnage
end
