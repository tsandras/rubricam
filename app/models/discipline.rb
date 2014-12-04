class Discipline < ActiveRecord::Base
  attr_accessible :description, :niveau, :nom, :nom_discipline

  has_and_belongs_to_many :combinaisons, class_name: 'Combinaison'
  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end
