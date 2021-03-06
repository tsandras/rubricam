# == Schema Information
#
# Table name: objets_routines
#
#  id         :integer          not null, primary key
#  objet_id   :integer
#  routine_id :integer
#

class ObjetsRoutines < ActiveRecord::Base
  attr_accessible :objet_id, :routine_id

  belongs_to :objet
  belongs_to :routine
end
