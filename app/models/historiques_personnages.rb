# == Schema Information
#
# Table name: historiques_personnages
#
#  id            :integer          not null, primary key
#  personnage_id :integer
#  historique_id :integer
#  niveau        :integer
#  detail        :string(255)
#

class HistoriquesPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :historique_id, :niveau, :detail

  belongs_to :personnage
  belongs_to :historique
end
