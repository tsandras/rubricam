# == Schema Information
#
# Table name: lieus
#
#  id                   :integer          not null, primary key
#  nom                  :string(255)
#  description          :text(255)
#  type_lieu            :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  secret               :boolean
#  description_publique :text
#  image_lien           :string(255)
#

class Lieu < ActiveRecord::Base
  attr_accessible :description, :nom, :type_lieu, :secret, :description_publique,
                  :image_lien, :personnage_ids

  validates_presence_of :type_lieu, :nom, :description

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_and_belongs_to_many :historiques, class_name: 'Historique'

  TYPE_LIEUX = ["Plan", "Planète", "Pays", "Ville", "Lieu"]
end
