# == Schema Information
#
# Table name: atouts_personnages
#
#  id            :integer          not null, primary key
#  personnage_id :integer
#  atout_id      :integer
#  detail        :string(255)
#

class AtoutsPersonnages < ActiveRecord::Base
  attr_accessible :personnage_id, :atout_id, :detail

  belongs_to :personnage
  belongs_to :atout
end
