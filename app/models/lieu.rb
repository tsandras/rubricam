class Lieu < ActiveRecord::Base
  attr_accessible :description, :nom, :type

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_and_belongs_to_many :historiques, class_name: 'Historique'
end
