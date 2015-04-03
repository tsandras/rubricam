# == Schema Information
#
# Table name: objets
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  niveau        :integer
#  type_objet    :string(255)
#  resonnance    :string(255)
#  personnage_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  secret        :boolean
#  valeur        :integer
#  dynamique     :integer
#  statique      :integer
#  entropique    :integer
#  routine_id    :integer
#  user_id       :integer
#

class Objet < ActiveRecord::Base
  attr_accessible :description, :name, :niveau, :personnage_id, :resonnance,
                  :type_objet, :secret, :valeur, :dynamique, :statique, :entropique,
                  :routine_id, :user_id

  belongs_to :personnage
  belongs_to :user
  has_one :routine

  scope :none_secret, lambda { where("secret = ? or secret is null", false) }
  scope :own_objets, ->(user_id) { where("user_id = ?", user_id) }
  scope :none_secret_and_own_objets, ->(user_id) { where("user_id = ? or secret <> ?", user_id, true) }

  TYPE_OBJET = ["Statique", "Dynamique"]

  validates_presence_of :name, :niveau, :description
end
