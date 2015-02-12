# == Schema Information
#
# Table name: disciplines_personnages
#
#  id            :integer          not null, primary key
#  personnage_id :integer
#  discipline_id :integer
#  niveau        :integer
#  voie          :string(255)
#

class DisciplinesPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :discipline_id, :niveau, :voie

  belongs_to :personnage
  belongs_to :discipline
  has_and_belongs_to_many :nivdiscipline, class_name: 'Nivdiscipline'
end
