# == Schema Information
#
# Table name: personnages_royaumes
#
#  id            :integer          not null, primary key
#  personnage_id :integer
#  royaume_id    :integer
#  niveau        :integer
#

class PersonnagesRoyaumes < ActiveRecord::Base
  attr_accessible :personnage_id, :royaume_id, :niveau

  belongs_to :personnage
  belongs_to :royaume
end
