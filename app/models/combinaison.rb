class Combinaison < ActiveRecord::Base
  attr_accessible :description, :niveau, :nom

  has_and_belongs_to_many :disciplines, class_name: 'Discipline'
  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end
