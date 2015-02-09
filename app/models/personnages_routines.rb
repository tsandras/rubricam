# == Schema Information
#
# Table name: personnages_routines
#
#  id            :integer          not null, primary key
#  personnage_id :integer
#  routine_id    :integer
#

class PersonnagesRoutines < ActiveRecord::Base
  attr_accessible :personnage_id, :routine_id

  belongs_to :personnage
  belongs_to :routine
end
