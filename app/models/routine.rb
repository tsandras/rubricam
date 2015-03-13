# == Schema Information
#
# Table name: routines
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  foci               :text
#  combinaison        :string(255)
#  type               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  secret             :boolean
#  nbs_succes         :integer
#  nbs_quintessence   :integer
#  volonte_permanente :boolean
#  effet              :text
#  correspondance     :integer
#  entropie           :integer
#  esprit             :integer
#  forces             :integer
#  matiere            :integer
#  prime              :integer
#  psyche             :integer
#  temps              :integer
#  vie                :integer
#  user_id            :integer
#

class Routine < ActiveRecord::Base
  attr_accessible :combinaison, :description, :foci, :name, :type, :secret,
                  :nbs_succes, :nbs_quintessence, :volonte_permanente, :effet,
                  :correspondance, :entropie, :esprit, :forces, :matiere,
                  :prime, :psyche, :temps, :vie, :user_id

  validates_presence_of :name, :type, :description

  has_and_belongs_to_many :personnages, class_name: 'Personnage'
  has_many :objets, class_name: 'Objet'
  belongs_to :user

  scope :none_secret, lambda { where("secret <> ?", true) }
  scope :own_routines, ->(user_id) { where("user_id = ?", user_id) }
  scope :none_secret_or_own_routines, ->(user_id) { where("user_id = ? or secret <> ?", user_id, true) }

  TYPE_ROUTINE = ["Routine", "Enchantement", "Rituel", "Création d'objet"]

  validates_presence_of :name, :type, :description

end
