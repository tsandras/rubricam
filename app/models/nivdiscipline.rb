class Nivdiscipline < ActiveRecord::Base
  attr_accessible :description, :nom, :niveau, :source, :discipline_id

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  belongs_to :discipline
end
