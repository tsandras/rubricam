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
#

class Routine < ActiveRecord::Base
  attr_accessible :combinaison, :description, :foci, :name, :type, :secret,
                  :nbs_succes, :nbs_quintessence, :volonte_permanente, :effet,
                  :correspondance, :entropie, :esprit, :forces, :matiere,
                  :prime, :psyche, :temps, :vie

  has_and_belongs_to_many :personnages, class_name: 'Personnage'

  TYPE_ROUTINE = ["Routine", "Enchantement", "Rituel", "Création d'objet"]
end
