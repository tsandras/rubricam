# == Schema Information
#
# Table name: disciplines
#
#  id             :integer          not null, primary key
#  nom            :string(255)
#  description    :text
#  nom_discipline :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Discipline < ActiveRecord::Base
  attr_accessible :description, :nom, :nom_discipline

  has_and_belongs_to_many :combinaisons, class_name: 'Combinaison'
  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_many :nivdisciplines, :class_name => 'Nivdiscipline', :foreign_key => 'discipline_id'
end
