# == Schema Information
#
# Table name: historiques_lieus
#
#  id            :integer          not null, primary key
#  historique_id :integer
#  lieu_id       :integer
#  niveau        :integer
#

class HistoriquesLieus < ActiveRecord::Base
  attr_accessible :historique_id, :lieu_id, :niveau

  belongs_to :historique
  belongs_to :lieu
end
