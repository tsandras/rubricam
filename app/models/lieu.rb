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
#  avatar               :string(255)
#  svg_x                :decimal(5, 6)
#  svg_y                :decimal(5, 6)
#

require 'carrierwave/orm/activerecord'

class Lieu < ActiveRecord::Base
  attr_accessible :description, :nom, :type_lieu, :secret, :description_publique,
                  :image_lien, :personnage_ids, :organisation_ids, :avatar, :avatar_cache,
                  :image_lien, :personnage_ids, :organisation_ids, :svg_x, :svg_y

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :type_lieu, :nom, :description

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_and_belongs_to_many :organisations, class_name: 'Organisation'
  has_and_belongs_to_many :historiques, class_name: 'Historique'

  scope :locatable, -> { where("svg_x is not null and svg_y is not null") }
  scope :lieu_ou_ville, -> { where("type_lieu = ? or type_lieu = ?", TYPE_LIEUX[3], TYPE_LIEUX[4]) }

  TYPE_LIEUX = ["Plan", "Planète", "Pays", "Ville", "Lieu"]

  def avatar_url_perso
    out = avatar_url.split("/")
    "#{out[0..2].join("/")}/rubricam-avatars/#{out[3..-1].join("/")}"
  end
end
