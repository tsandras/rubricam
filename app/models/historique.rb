class Historique < ActiveRecord::Base
  attr_accessible :description, :nom

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_and_belongs_to_many :lieus, class_name: 'Lieu'
end
