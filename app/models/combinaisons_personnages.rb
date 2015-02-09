# == Schema Information
#
# Table name: combinaisons_personnages
#
#  id             :integer          not null, primary key
#  personnage_id  :integer
#  combinaison_id :integer
#

class CombinaisonsPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :combinaison_id

  belongs_to :personnage
  belongs_to :combinaison
end
