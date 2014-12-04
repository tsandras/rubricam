class Organisation < ActiveRecord::Base
  attr_accessible :date, :description, :nom, :type

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end
