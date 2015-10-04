# == Schema Information
#
# Table name: combinaisons_disciplines
#
#  id             :integer          not null, primary key
#  combinaison_id :integer
#  discipline_id  :integer
#  niveau         :integer
#

class CombinaisonsDisciplines < ActiveRecord::Base
  attr_accessible :combinaison_id, :discipline_id, :niveau

  belongs_to :combinaison
  belongs_to :discipline
end
