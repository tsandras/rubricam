class Atout < ActiveRecord::Base
  attr_accessible :cout, :description, :nom

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
end
