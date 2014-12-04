class Sphere < ActiveRecord::Base
  attr_accessible :description, :name, :niveau, :personnage_id, :specialite

  belongs_to :personnage

  SPHERE = ["Correspondance", "Entropie", "Esprit", "Forces", "Matiere", "Prime", "Psyche", "Temps", "Vie"]
end
