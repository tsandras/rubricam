class Personnage < ActiveRecord::Base
  attr_accessible :date_mort, :date_naissance, :description, :nom,
  :paradygme, :background, :prenom,
  :apparence, :astuce, :charisme,
  :dexterite, :force, :vigueur,
  :intelligence, :manipulation, :perception,
  :points_conscience, :points_courage, :points_maitrise,
  :points_dynamique, :points_entropique, :points_statique,
  :volonte, :xps, :bonus, :entelechie, :capacite_ids, :historique_ids, :atout_ids, :discipline_ids,
  :spec_force, :spec_dexterite, :spec_vigueur, :spec_charisme, :spec_manipulation,
  :spec_apparence, :spec_perception, :spec_intelligence, :spec_astuce,
  :reste_xps, :reste_bonus, :type_perso, :nature, :attitude, :rang, :points_sang, :glamour,
  :banalite, :niveau_voie, :voie, :tradition, :clan,
  :caracteristique_base, :caracteristique_bonus, :has_base, :has_bonus

  validates_presence_of :type_perso, :bonus

  has_and_belongs_to_many :capacites, class_name: 'Capacite'
  has_and_belongs_to_many :atouts, class_name: 'Atout'
  has_and_belongs_to_many :historiques, class_name: 'Historique'
  has_and_belongs_to_many :organisations, class_name: 'Organisation'
  has_and_belongs_to_many :lieus, class_name: 'Lieu'
  has_and_belongs_to_many :routines, class_name: 'Routine'
  has_and_belongs_to_many :combinaisons, class_name: 'Combinaison'
  has_and_belongs_to_many :disciplines, class_name: 'Discipline'
  has_and_belongs_to_many :royaumes, class_name: 'Royaume'
  has_and_belongs_to_many :arts, class_name: 'Art'
  has_many :relations, :class_name => 'Relation', :foreign_key => 'to_personnage_id'
  has_many :relations, :class_name => 'Relation', :foreign_key => 'from_personnage_id'
  has_many :spheres, :class_name => 'Sphere', :foreign_key => 'personnage_id'
  has_many :objets, :class_name => 'Objet', :foreign_key => 'personnage_id'

  TYPE = ["Mage", "Vampire", "Mortel", "Goule", "Kinain", "Mage-Goule", "Mage-Kinain", "Technocrate", "Néphandi"]
  TRADITION = ["Verbena", "Ordre d'Hermès", "Choeur Céleste", "Adeptes du virtuel",
               "Fraternité Akashite", "Euthanatos", "Onirologues", "Fils de l'Ether",
               "Culte de l'Extase", "Excavés", "Orphelins"]
  SPHERES_TRADITION = {"Verbena" => "Vie", "Ordre d'Hermès" => "Forces", "Choeur Céleste" => "Prime",
                       "Adeptes du virtuel" => "Correspondance", "Fraternité Akashite" => "Psyche",
                       "Euthanatos" => "", "Onirologues", "Fils de l'Ether",
                       "Culte de l'Extase", "Excavés", "Orphelins"}
  CLAN = ["Assamites", "Brujah", "Cappadocian", "Setite", "Gangrel", "Giovanni",
          "Lasombra", "Malkavian", "Nosferatu", "Ravnos", "Salubrien", "Toreador",
          "Tremere", "Tzimisce", "Ventrue", "Ahrimane", "Baali", "Caïtiffs", "Gargouilles",
          "Kiasyds", "Laïbon", "Lamia", "Lhiannan", "Nagaraja", "Samedi", "Serpent de la lumière",
          "Vrai Brujah", "Andas", "Noiad"]
  DISCIPLINES_CLAN = {"Assamites" => ["Celerite", "Quietus", "Dissimulation"], "Brujah" => ["Puissance", "Celerite", "Presence"],
                      "Cappadocian" => ["Endurance", "Necromancie", "Domination"], "Setite" => ["Serpentis", "Dissimulation", "Puissance"],
                      "Gangrel" => ["Endurance", "Protean", "Animalis"], "Giovanni" => ["Domination", "Necromancie", "Je sais pas"],
                      "Lasombra" => ["Puissance", "Obtenebration", "Domination"], "Malkavian" => ["Folie", "Domination", "Presence"],
                      "Nosferatu" => ["Endurance", "Dissimulation", "Animalis"], "Ravnos" => ["Celerite", "Illusion", "sais pas"],
                      "Salubrien" => ["Obean", "Edurance", "Sais pas"], "Toreador" => ["Auspex", "Celerite", "Presence"],
                      "Tremere" => ["Thaumaturgie", "Domination", "Auspex"], "Tzimisce" => ["Vissicitude", "Auspex", "Autre"],
                      "Ventrue" => ["Endurance", "Domination", "Presence"], "Ahrimane" => ["", "", ""],
                      "Baali" => ["Dissimulation", "Demon", "Autre"], "Caïtiffs" => ["Puissance", "Celerite", "Endurance"],
                      "Gargouilles" => ["", "", ""], "Kiasyds" => ["Fee", "autre", "autre"],
                      "Laïbon" => ["", "", ""], "Lamia" => ["", "", ""],
                      "Lhiannan" => ["", "", ""], "Nagaraja" => ["", "", ""],
                      "Samedi" => ["", "", ""], "Serpent de la lumière" => ["", "", ""],
                      "Vrai Brujah" => ["", "", ""], "Andas" => ["", "", ""],
                      "Noiad" => ["", "", ""], "Agarash" => ["Necromancie", "Protean", "Domination"]
                      "Secret" => ["", "", ""]}
  VOIE = ["La Voie de l'Humanité", "La Voie de la Bête", "La Voie de la Chevalerie", "La Voie des Coeurs Ecorchés",
          "La Voie de la concentration Intérieure", "La Voie du Diable", "La Voie de Lilith",
          "La Voie des Métamorphoses", "La Voie de la Nuit", "La Voie des Ossements",
          "La Voie du Paradis", "La Voie du Paradoxe", "La Voie du Sang", "La Voie du Typhon"]

  ARCHETYPE = ["Abandonné", "Ange Gardien", "Architecte", "Autiste", "Autocrate",
               "Avant Gardiste", "Barbare", "Battant", "Bon Vivant", "Bouffon",
               "Brute", "Chevalier", "Confident", "Conformiste", "Déviant",
               "Dirigeant", "Enfant", "Fanatique", "Gardien", "Gourou",
               "Grincheux", "Idéaliste", "Individualiste", "Innovateur",
               "Opportuniste", "Optimiste", "Passionné", "Pédagogue", "Pénitent",
               "Perfectionniste", "Poltron", "Provocateur", "Rebelle", "Risque Tout",
               "Satique", "Sage", "Scientifique", "Séducteur", "Sensuel", "Sociopathe",
               "Soldat", "Solitaire", "Survivant", "Tyran", "Visionnaire"]

  ATTRIBUT = ["force", "dexterite", "vigueur",
                     "charisme", "manipulation", "apparence",
                     "perception", "intelligence", "astuce"]

  def has_resonnances
    return false if points_dynamique == nil && points_entropique == nil && points_statique == nil
    true
  end

  def has_vertues
    return false if points_conscience == nil && points_courage == nil && points_maitrise == nil
    true
  end

  def has_valide_personnage_base
    physique = force + dexterite + vigueur
    social = charisme + manipulation + apparence
    mental = perception + intelligence + astuce
    # talent = 0
    # competence = 0
    # connaissance = 0
    self.capacites.each do |c|
      add = 1 if c.primaire
      add = 0.5 unless c.primaire
      if c.type_cap == "Talent"
        talent = talent + add
      elsif c.type_cap == "Compétence"
        competence = competence + add
      else
        connaissance = connaissance + add
      end
    end
    self.historiques.each do |c|
      historique = historique + 1
    end
    return false if physique != 10 || physique != 8 || physique != 6
    return false if social != 10 || social != 8 || social != 6
    return false if mental != 10 || mental != 8 || mental != 6
    return false if physique == mental || physique == social || social == mental
    return false if talent != 13 || talent != 9 || talent != 5
    return false if competence != 13 || competence != 9 || competence != 5
    return false if connaissance != 13 || connaissance != 9 || connaissance != 5
    return false if talent == competence || talent == connaissance || competence == connaissance
    return false if historique != 7
    true
  end
end
