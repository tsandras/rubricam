# == Schema Information
#
# Table name: arts_personnages
#
#  id            :integer          not null, primary key
#  personnage_id :integer
#  art_id        :integer
#  niveau        :integer
#

class ArtsPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :art_id, :niveau

  belongs_to :personnage
  belongs_to :art
end
