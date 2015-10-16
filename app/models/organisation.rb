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
#  avatar               :string(255)
#

require 'carrierwave/orm/activerecord'

class Organisation < ActiveRecord::Base
  attr_accessible :date, :description, :nom, :type_organisation, :secret,
                  :description_publique, :image_lien, :personnage_ids, :avatar, :avatar_cache

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :nom, :type_organisation, :description

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_and_belongs_to_many :lieus, class_name: 'Lieu'

  scope :none_secret, lambda { where("secret = ? or secret is null", false) }

  TYPE_ORGANISATION = ["Tradition", "Fondation", "Corporation", "Cabale", "Clan", "Lignée", "Secte", "Coterie", "Autre"]

  def avatar_url_perso
    out = avatar_url.split("/")
    "#{out[0..2].join("/")}/rubricam-avatars/#{out[3..-1].join("/")}"
  end
end
