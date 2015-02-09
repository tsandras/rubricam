# == Schema Information
#
# Table name: lieus
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :string(255)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lieu < ActiveRecord::Base
  attr_accessible :description, :nom, :type

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_and_belongs_to_many :historiques, class_name: 'Historique'
end
