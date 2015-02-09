# == Schema Information
#
# Table name: capacites_personnages
#
#  id            :integer          not null, primary key
#  personnage_id :integer
#  capacite_id   :integer
#  niveau        :integer
#  specialite    :string(255)
#

class CapacitesPersonnages < ActiveRecord::Base
  attr_accessible :niveau, :personnage_id, :capacite_id, :specialite

  belongs_to :personnage
  belongs_to :capacite
end
