# == Schema Information
#
# Table name: parties_personnages
#
#  id            :integer          not null, primary key
#  personnage_id :integer
#  partie_id     :integer
#

class PartiesPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :partie_id

  belongs_to :personnage
  belongs_to :partie
end
