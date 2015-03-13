# == Schema Information
#
# Table name: organisations
#
#  id                   :integer          not null, primary key
#  nom                  :string(255)
#  description          :text
#  type_organisation    :string(255)
#  date                 :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  secret               :boolean
#  description_publique :text
#  image_lien           :string(255)
#

class Organisation < ActiveRecord::Base
  attr_accessible :date, :description, :nom, :type_organisation, :secret,
                  :description_publique, :image_lien, :personnage_ids

  validates_presence_of :nom, :type_organisation, :description

  has_and_belongs_to_many :personnages, class_name: 'Personnage'

  scope :none_secret, lambda { where("secret <> ?", true) }

  TYPE_ORGANISATION = ["Tradition", "Fondation", "Corporation", "Cabale", "Clan", "Lignée", "Secte", "Coterie"]
end
