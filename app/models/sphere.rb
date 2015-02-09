# == Schema Information
#
# Table name: spheres
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  specialite    :string(255)
#  description   :text
#  niveau        :integer
#  personnage_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Sphere < ActiveRecord::Base
  attr_accessible :description, :name, :niveau, :personnage_id, :specialite

  belongs_to :personnage

  SPHERE = ["Correspondance", "Entropie", "Esprit", "Forces", "Matiere", "Prime", "Psyche", "Temps", "Vie"]
  SPHERE_DESCRIPTION = {"Correspondance" => "Ceci est la description de Correspondance.",
                        "Entropie" => "Ceci est la description de Entropie.",
                        "Esprit" => "Ceci est la description de Esprit.",
                        "Forces" => "Ceci est la description de Forces.",
                        "Matiere" => "Ceci est la description de Matiere.",
                        "Prime" => "Ceci est la description de Prime.",
                        "Psyche" => "Ceci est la description de Psyche.",
                        "Temps" => "Ceci est la description de Temps.",
                        "Vie" => "Ceci est la description de Vie."}
end
