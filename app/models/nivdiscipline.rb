class Nivdiscipline < ActiveRecord::Base
  attr_accessible :description, :nom, :niveau

  has_and_belongs_to_many :disciplines_personnages, class_name: 'DisciplinesPersonnages'
end
