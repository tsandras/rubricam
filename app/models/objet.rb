# == Schema Information
#
# Table name: objets
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  niveau        :integer
#  type          :string(255)
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
#

class Objet < ActiveRecord::Base
  attr_accessible :description, :name, :niveau, :personnage_id, :resonnance,
                  :type, :secret, :valeur, :dynamique, :statique, :entropique,
                  :routine_id

  belongs_to :personnage

  TYPE_OBJET = ["Statique", "Dynamique"]
end
