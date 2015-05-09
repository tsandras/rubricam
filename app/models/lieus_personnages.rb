# == Schema Information
#
# Table name: lieus_personnages
#
#  id            :integer          not null, primary key
#  personnage_id :integer
#  lieu_id       :integer
#  nom           :string(255)
#  description   :text
#

class LieusPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :organisation_id, :nom, :description

  belongs_to :personnage
  belongs_to :lieu
end
