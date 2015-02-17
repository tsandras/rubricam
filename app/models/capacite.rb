# == Schema Information
#
# Table name: capacites
#
#  id          :integer          not null, primary key
#  nom         :string(255)
#  description :text
#  primaire    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  type_cap    :string(255)
#  source      :string(255)
#

class Capacite < ActiveRecord::Base
  attr_accessible :description, :nom, :primaire, :type_cap, :source

  has_and_belongs_to_many :personnages, class_name: 'Personnage'

  TYPE_CAPACITE = ["Talent", "Compétence", "Connaissance"]

  CAPACITE_DESCRIPTION = {"Talent" => "Les talents regroupent ce que vous savez intuitivement, ce que vous pouvez faire sans apprentissage particulier. La seule façon d'améliorer vos talents est l'expérience directe. À de rares exceptions près, ces choses ne peuvent être apprises dans les livres ou par correspondance. Si votre personnage veut tenter une action demandant un talent qu'il ne possède pas, il ne subit pas de pénalité au groupement de dés de son attribut de base: ces capacités sotn si instinctives que quasiment tout le monde les maîtrise à un degré ou un autre.",
                          "Compétence" => "Les compétences sont les capacités apprises par l'entraînement ou la pratique. Si vous tentez une action demandant une compétence que vous ne possédez pas, la difficulté est augmenté de +1. Un travailleur incompétent n'est pas aussi efficace que quelqu'un ayant des attributs plus faible, mais qui comprend la procédure à suivre.",
                          "Connaissance" => "Les connaissances impliquent l'utilisation de son cerveau, pas de son corps. En conséquence, elles sont le plus souvent utilisées avec une caractéristique mentale. Si vous n'avez aucun point dans une connaissance, vous ne pouvez même pas tenter un jet y faisant appel, sauf si le conteur le permet (s'il sagit de culture générale par exemple)."}
end
