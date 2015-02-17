# == Schema Information
#
# Table name: historiques
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  has_detail  :boolean
#  source      :string(255)
#

class Historique < ActiveRecord::Base
  attr_accessible :description, :nom, :has_detail, :source

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_and_belongs_to_many :lieus, class_name: 'Lieu'
end
