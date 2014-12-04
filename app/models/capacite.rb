class Capacite < ActiveRecord::Base
  attr_accessible :description, :nom, :primaire, :type_cap

  has_and_belongs_to_many :personnages, class_name: 'Personnage'

  TYPE_CAPACITE = ["Talent", "Compétence", "Connaissance"]
end
