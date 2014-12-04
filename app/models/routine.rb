class Routine < ActiveRecord::Base
  attr_accessible :combinaison, :description, :foci, :name, :type

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end
