# == Schema Information
#
# Table name: nivdisciplines_personnages
#
#  id               :integer          not null, primary key
#  personnage_id    :integer
#  nivdiscipline_id :integer
#

class NivdisciplinesPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :nivdiscipline_id

  belongs_to :nivdiscipline
  belongs_to :personnage
end
