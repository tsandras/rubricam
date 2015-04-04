# == Schema Information
#
# Table name: personnages
#
#  id                    :integer          not null, primary key
#  nom                   :string(255)
#  prenom                :string(255)
#  date_naissance        :datetime
#  description           :text
#  volonte               :integer
#  background            :text
#  force                 :integer
#  dexterite             :integer
#  vigueur               :integer
#  charisme              :integer
#  manipulation          :integer
#  apparence             :integer
#  perception            :integer
#  intelligence          :integer
#  astuce                :integer
#  paradygme             :text
#  xps                   :integer
#  bonus                 :integer
#  date_mort             :datetime
#  points_conscience     :integer
#  points_maitrise       :integer
#  points_courage        :integer
#  points_dynamique      :integer
#  points_statique       :integer
#  points_entropique     :integer
#  entelechie            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  spec_force            :string(255)
#  spec_dexterite        :string(255)
#  spec_vigueur          :string(255)
#  spec_charisme         :string(255)
#  spec_manipulation     :string(255)
#  spec_apparence        :string(255)
#  spec_perception       :string(255)
#  spec_intelligence     :string(255)
#  spec_astuce           :string(255)
#  reste_xps             :integer
#  type_perso            :string(255)
#  nature                :string(255)
#  attitude              :string(255)
#  rang                  :integer
#  points_sang           :integer
#  glamour               :integer
#  banalite              :integer
#  niveau_voie           :integer
#  voie                  :string(255)
#  tradition             :string(255)
#  clan                  :string(255)
#  caracteristique_base  :text
#  caracteristique_bonus :text
#  reste_bonus           :string(255)
#  has_base              :boolean
#  has_bonus             :boolean
#  user_id               :integer
#  secret                :boolean
#  description_publique  :text
#  image_lien            :string(255)
#  niveau_physique       :integer
#  niveau_social         :integer
#  niveau_mental         :integer
#  niveau_magdynamique   :integer
#  niveau_magstatique    :integer
#  niveau_ressources     :integer
#  pnj                   :boolean
#  nom_publique          :string(255)
#  detail_dynamique      :string(255)
#  detail_statique       :string(255)
#  detail_entropique     :string(255)
#
require 'carrierwave/orm/activerecord'

class Personnage < ActiveRecord::Base
  include PersonnagesConstantes
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
  :caracteristique_base, :caracteristique_bonus, :has_base, :has_bonus, :user_id, :secret,
  :description_publique, :nom_publique, :image_lien, :routine_ids, :pnj, :detail_dynamique,
  :detail_statique, :detail_entropique, :avatar, :avatar_cache

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :type_perso, :bonus, :prenom

  has_and_belongs_to_many :capacites, class_name: 'Capacite'
  has_and_belongs_to_many :atouts, class_name: 'Atout'
  has_and_belongs_to_many :historiques, class_name: 'Historique'
  has_and_belongs_to_many :organisations, class_name: 'Organisation'
  has_and_belongs_to_many :lieus, class_name: 'Lieu'
  has_and_belongs_to_many :routines, class_name: 'Routine'
  has_and_belongs_to_many :combinaisons, class_name: 'Combinaison'
  has_and_belongs_to_many :disciplines, class_name: 'Discipline'
  has_and_belongs_to_many :nivdisciplines, class_name: 'Nivdiscipline'
  has_and_belongs_to_many :royaumes, class_name: 'Royaume'
  has_and_belongs_to_many :arts, class_name: 'Art'
  has_and_belongs_to_many :parties, class_name: 'Partie'
  has_many :relations, :class_name => 'Relation', :foreign_key => 'to_personnage_id'
  has_many :relations, :class_name => 'Relation', :foreign_key => 'from_personnage_id'
  has_many :spheres, :class_name => 'Sphere', :foreign_key => 'personnage_id'
  has_many :objets, :class_name => 'Objet', :foreign_key => 'personnage_id'
  belongs_to :user

  scope :own_personnages, ->(user_id) { where("user_id = ?", user_id) }
  scope :pnjs, lambda { where("pnj = ?", true) }
  scope :pjs, lambda { where("pnj = ? or pnj is null", false) }
  scope :none_secret, lambda { where("secret = ? or secret is null", false) }
  scope :none_secret_and_pnjs, lambda { where("(secret = ? or secret is null) and pnj = ?", false, true) }

  def has_resonnances
    return false if points_dynamique == nil && points_entropique == nil && points_statique == nil
    true
  end

  def has_vertues
    return false if points_conscience == nil && points_courage == nil && points_maitrise == nil
    true
  end

  def has_graph
    if niveau_physique.present? && niveau_social.present? &&
       niveau_mental.present? && niveau_magdynamique.present? &&
       niveau_magstatique.present? && niveau_ressources.present?
      true
    else
      false
    end
  end

  def vampire?
    type_perso == "Vampire"
  end

  def mage?
    type_perso == "Mage"
  end

  def humain?
    type_perso == "Humain"
  end

  def avatar_url_perso
    out = avatar_url.split("/")
    "#{out[0..2].join("/")}/rubricam-avatars/#{out[3..-1].join("/")}"
  end

  def calcule_rang
    if has_base
      p_attribus = (force + dexterite + vigueur + charisme + manipulation + apparence + perception + intelligence + astuce) * 4
      p_capacites = CapacitesPersonnages.where(personnage_id: id).sum(&:niveau) * 2
      p_historiques = HistoriquesPersonnages.where(personnage_id: id).sum(&:niveau)
      p_atout = AtoutsPersonnages.where(personnage_id: id).map{|ap| ap.atout.cout }.sum() * 3
      p_disciplines = DisciplinesPersonnages.where(personnage_id: id).sum(&:niveau) * 5
      p_autre = volonte.to_i * 4 + entelechie.to_i * 8 + spheres.sum(&:niveau).to_i * 8 + (points_conscience.to_i + points_maitrise.to_i + points_courage.to_i) * 3
      p_autre = p_autre + (points_statique.to_i + points_entropique.to_i + points_dynamique.to_i) * 2
      self.rang = p_attribus + p_capacites + p_historiques + p_atout + p_disciplines + p_autre
    else
      self.rang = 0
    end
  end

  def calcule_graph
    if has_base
      cap_phy_id = capacites.select{|cap| Personnage::CAP_PHYSIQUE.include?(cap.nom)}.map{|cap| cap.id}
      cap_soc_id = capacites.select{|cap| Personnage::CAP_SOCIAL.include?(cap.nom)}.map{|cap| cap.id}
      cap_men_id = capacites.select{|cap| Personnage::CAP_MENTAL.include?(cap.nom)}.map{|cap| cap.id}
      self.niveau_physique = (force + dexterite + vigueur) * 4 + CapacitesPersonnages.where(capacite_id: cap_phy_id, personnage_id: id).sum(&:niveau)
      self.niveau_social = (charisme + manipulation + apparence) * 4 + CapacitesPersonnages.where(capacite_id: cap_phy_id, personnage_id: id).sum(&:niveau)
      self.niveau_mental = (perception + intelligence + astuce) * 4 + CapacitesPersonnages.where(capacite_id: cap_phy_id, personnage_id: id).sum(&:niveau)
      self.niveau_magdynamique = spheres.sum(&:niveau).to_i * 8
      self.niveau_magstatique = DisciplinesPersonnages.where(personnage_id: id).sum(&:niveau) * 5
      self.niveau_ressources = HistoriquesPersonnages.where(personnage_id: id).sum(&:niveau) * 3
    end
  end

  def name_rang
    if has_base && !rang.nil?
      if rang < SEUIL_C
          "D"
      elsif rang < SEUIL_B
        "C"
      elsif rang < SEUIL_A
        "B"
      elsif rang < SEUIL_S
        "A"
      else
        "S"
      end
    else
      "-"
    end
  end

  def ok_base(personnage, capacites, historiques, spheres, disciplines)
    physique = personnage[:force].to_i + personnage[:dexterite].to_i + personnage[:vigueur].to_i
    social = personnage[:charisme].to_i + personnage[:manipulation].to_i + personnage[:apparence].to_i
    mental = personnage[:perception].to_i + personnage[:intelligence].to_i + personnage[:astuce].to_i
    talent = 0
    competence = 0
    connaissance = 0
    historique = 0
    if capacites != nil
      capacites.each do |key, c|
        # raise key.inspect if key == nil
        if is_cp(key)
          capper = CapacitesPersonnages.find(key)
          cap = capper.capacite
        else
          cap = Capacite.find(key)
        end
        add = 1 if cap.primaire
        add = 0.5 unless cap.primaire
        add = add * c[:niveau].to_i
        if cap.type_cap == "Talent"
          talent = talent + add
        elsif cap.type_cap == "Compétence"
          competence = competence + add
        else
          connaissance = connaissance + add
        end
      end
    end
    if historiques != nil
      historiques.each do |key, c|
        historique = historique + c[:niveau].to_i
      end
    end
    # raise ok_base_surnaturel(personnage, spheres, disciplines).inspect
    # puts "physique : #{physique}, social : #{social}, mental : #{mental}"
    # puts "talent : #{talent}, competence : #{competence}, connaissance : #{connaissance}"
    # puts "historique : #{historique}, surnaturel : #{ok_base_surnaturel(personnage, spheres, disciplines)}"
    return false unless ok_base_surnaturel(personnage, spheres, disciplines)
    return false unless physique != 10 || physique != 8 || physique != 6
    return false unless social != 10 || social != 8 || social != 6
    return false unless mental != 10 || mental != 8 || mental != 6
    return false if physique == mental || physique == social || social == mental
    return false unless talent != 13 || talent != 9 || talent != 5
    return false unless competence != 13 || competence != 9 || competence != 5
    return false unless connaissance != 13 || connaissance != 9 || connaissance != 5
    return false if talent == competence || talent == connaissance || competence == connaissance
    return false if historique != 7
    true
  end

  def ok_base_surnaturel(personnage, spheres, disciplines)
    if vampire?
      if disciplines != nil
        dis = 0
        disciplines.each do |key, c|
          dis = dis + c[:niveau].to_i
        end
        return false if dis != 4
        return true
      else
        return false
      end
    elsif mage?
      if spheres != nil
        sph = 0
        spheres.each do |key, c|
          sph = sph + c[:niveau].to_i
        end
        # raise (sph != 6 || (sph != 5 && tradition == "Orphelins")).inspect
        return false if sph != 6 && tradition != "Orphelins"
        return false if sph != 5 && tradition == "Orphelins"
        return true
      else
        return false
      end
      return false if personage[:entelechie].to_i != 1
    end
    true
  end

  def ok_bonus(personnage, capacites, historiques, atouts, spheres, disciplines)
    perso_base = JSON.parse(caracteristique_base)
    points_attributs = 0
    points_capacites = 0
    points_historique = 0
    points_attributs = points_attributs + (personnage[:force].to_i - perso_base["Personnage"]["force"]) * 4;
    points_attributs = points_attributs + (personnage[:dexterite].to_i - perso_base["Personnage"]["dexterite"]) * 4;
    points_attributs = points_attributs + (personnage[:vigueur].to_i - perso_base["Personnage"]["vigueur"]) * 4;
    points_attributs = points_attributs + (personnage[:charisme].to_i - perso_base["Personnage"]["charisme"]) * 4;
    points_attributs = points_attributs + (personnage[:manipulation].to_i - perso_base["Personnage"]["manipulation"]) * 4;
    points_attributs = points_attributs + (personnage[:apparence].to_i - perso_base["Personnage"]["apparence"]) * 4;
    points_attributs = points_attributs + (personnage[:perception].to_i - perso_base["Personnage"]["perception"]) * 4;
    points_attributs = points_attributs + (personnage[:intelligence].to_i - perso_base["Personnage"]["intelligence"]) * 4;
    points_attributs = points_attributs + (personnage[:astuce].to_i - perso_base["Personnage"]["astuce"]) * 4;
    perso_base["Capacites"]["Talent"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: id).first
      points_capacites = points_capacites + (capacites[capper.id.to_s][:niveau].to_i - pb.to_i) * 2
    end
    perso_base["Capacites"]["Competence"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: id).first
      points_capacites = points_capacites + (capacites[capper.id.to_s][:niveau].to_i - pb.to_i) * 2
    end
    perso_base["Capacites"]["Connaissance"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: id).first
      points_capacites = points_capacites + (capacites[capper.id.to_s][:niveau].to_i - pb.to_i) * 2
    end
    # perso_base["Historiques"].each do |key, pb|
    #   key = key.split("_")[1].to_i if key.split("_")[0] == "t"
    #   hisper = HistoriquesPersonnages.where(historique_id: key, personnage_id: id).first
    #   points_capacites = points_capacites + (historiques[hisper.id.to_s][:niveau].to_i - pb.to_i)
    # end
    # raise historiques.inspect
    historiques.each do |key, pb|
      if key.split("_")[0] == "t"
        key_batard = key.split("_")[1].to_i
        his = Historique.find(key_batard)
      else
        his = HistoriquesPersonnages.find(key.to_i).historique
      end
      points_capacites = points_capacites + (historiques[key][:niveau].to_i - perso_base["Historiques"][his.id.to_s].to_i)
    end
    # raise personnage.inspect
    personnage["atout_ids"].each do |id|
      if id.present?
        at = Atout.find(id)
        points_attributs = points_attributs + at.cout
      end
    end
    points_volonte = (personnage[:volonte].to_i - perso_base["Volonte"]);
    points_surnaturels = ok_bonus_surnaturel(perso_base, spheres, disciplines)
    # raise perso_base["Entelechie"].inspect
    ent = 0
    ent = (personnage[:entelechie].to_i - perso_base["Entelechie"].to_i) * 4 if mage?
    points_bonus = points_attributs + points_capacites + points_historique + points_surnaturels + points_volonte + ent
    # raise "#{points_bonus} != #{bonus}"
    return false if points_bonus != bonus
    true
  end

  def ok_bonus_surnaturel(perso_base, spheres, disciplines)
    out = 0
    if spheres != nil
      spheres.each do |key, sphere|
        # raise perso_base["Spheres"].inspect
        out = out + (sphere[:niveau].to_i - perso_base["Spheres"][key].to_i) * 7
      end
    end
    if disciplines != nil
      disciplines.each do |key, discipline|
        if is_dp(key)
          disper = DisciplinesPersonnages.find(key)
          dis_id = disper.discipline.id
        else
          dis_id = key
        end
        out = out + (discipline[:niveau].to_i - perso_base["Disciplines"][dis_id.to_s].to_i) * 7
      end
    end
    out
  end

  def create_caracteristique_bonus(personnage, capacites, historiques, atouts, spheres, disciplines)
    perso_base = JSON.parse(caracteristique_base)
    perso_bonus = {}
    perso_bonus["Personnage"] = {}
    perso_bonus["Personnage"]["force"] = personnage[:force].to_i - perso_base["Personnage"]["force"]
    perso_bonus["Personnage"]["dexterite"] = personnage[:dexterite].to_i - perso_base["Personnage"]["dexterite"]
    perso_bonus["Personnage"]["vigueur"] = personnage[:vigueur].to_i - perso_base["Personnage"]["vigueur"]
    perso_bonus["Personnage"]["charisme"] = personnage[:charisme].to_i - perso_base["Personnage"]["charisme"]
    perso_bonus["Personnage"]["manipulation"] = personnage[:manipulation].to_i - perso_base["Personnage"]["manipulation"]
    perso_bonus["Personnage"]["apparence"] = personnage[:apparence].to_i - perso_base["Personnage"]["apparence"]
    perso_bonus["Personnage"]["perception"] = personnage[:perception].to_i - perso_base["Personnage"]["perception"]
    perso_bonus["Personnage"]["intelligence"] = personnage[:intelligence].to_i - perso_base["Personnage"]["intelligence"]
    perso_bonus["Personnage"]["astuce"] = personnage[:astuce].to_i - perso_base["Personnage"]["astuce"]
    perso_bonus["Capacites"] = {}
    perso_bonus["Capacites"]["Talent"] = {}
    perso_bonus["Capacites"]["Competence"] = {}
    perso_bonus["Capacites"]["Connaissance"] = {}
    perso_base["Capacites"]["Talent"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: id).first
      perso_bonus["Capacites"]["Talent"][key] = capacites[capper.id.to_s][:niveau].to_i - pb.to_i
    end
    perso_base["Capacites"]["Competence"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: id).first
      perso_bonus["Capacites"]["Competence"][key] = capacites[capper.id.to_s][:niveau].to_i - pb.to_i
    end
    perso_base["Capacites"]["Connaissance"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: id).first
      perso_bonus["Capacites"]["Connaissance"][key] = capacites[capper.id.to_s][:niveau].to_i - pb.to_i
    end
    perso_bonus["Historiques"] = {}
    # perso_base["Historiques"].each do |key, pb|
    #   hisper = HistoriquesPersonnages.where(historique_id: key, personnage_id: id).first
    #   perso_bonus["Historiques"][key] = historiques[hisper.id.to_s][:niveau].to_i - pb.to_i
    # end
    historiques.each do |key, pb|
      if key.split("_")[0] == "t"
        key_batard = key.split("_")[1].to_i
        his = Historique.find(key_batard)
      else
        his = HistoriquesPersonnages.find(key.to_i).historique
      end
      perso_bonus["Historiques"][his.id.to_s] = historiques[key][:niveau].to_i - perso_base["Historiques"][his.id.to_s].to_i
    end

    perso_bonus["Atouts"] = {}
    personnage["atout_ids"].each do |id|
      if id.present?
        at = Atout.find(id)
        perso_bonus["Atouts"][id] = at.cout
      end
    end
    if spheres != nil
      perso_bonus["Spheres"] = {}
      spheres.each do |key, c|
        perso_bonus["Spheres"][key] = c[:niveau].to_i - perso_base["Spheres"][key].to_i
      end
    end
    if mage?
      perso_bonus["Entelechie"] = personnage[:entelechie].to_i - perso_base["Entelechie"].to_i
    end
    if disciplines != nil
      perso_bonus["Disciplines"] = {}
      disciplines.each do |key, c|
        if is_dp(key)
          hisper = DisciplinesPersonnages.find(key)
          hiss = hisper.discipline
        else
          hiss = Discipline.find(key)
        end
        perso_bonus["Disciplines"][hiss.id] = c[:niveau].to_i - perso_base["Disciplines"][hiss.id.to_s].to_i
      end
    end
    perso_bonus.to_json
  end

  def create_caracteristique_base(personnage, capacites, historiques, spheres, disciplines)
    per = "{\"force\": #{personnage[:force]}, \"dexterite\": #{personnage[:dexterite]}, \"vigueur\": #{personnage[:vigueur]},\"charisme\": #{personnage[:charisme]}, \"manipulation\": #{personnage[:manipulation]}, \"apparence\": #{personnage[:apparence]},\"perception\": #{personnage[:perception]}, \"intelligence\": #{personnage[:intelligence]}, \"astuce\": #{personnage[:astuce]}}"
    talent = {}
    competence = {}
    connaissance = {}
    capacites.each do |key, c|
      if key.split("_")[0] == "t"
        cap = Capacite.find(key.split("_")[1].to_i)
      else
        if is_cp(key)
          capper = CapacitesPersonnages.find(key)
          cap = capper.capacite
        else
          cap = Capacite.find(key)
        end
      end
      if cap.type_cap == "Talent"
        talent[cap.id] = c[:niveau].to_i
      elsif cap.type_cap == "Compétence"
        competence[cap.id] = c[:niveau].to_i
      else
        connaissance[cap.id] = c[:niveau].to_i
      end
    end
    cap = {}
    cap["Talent"] = talent
    cap["Competence"] = competence
    cap["Connaissance"] = connaissance
    his = {}
    historiques.each do |key, c|
      if key.split("_")[0] == "t"
        hiss = Historique.find(key.split("_")[1].to_i)
      else
        if is_hp(key)
          hisper = HistoriquesPersonnages.find(key)
          hiss = hisper.historique
        else
          hiss = Historique.find(key)
        end
      end
      his[hiss.id] = c[:niveau].to_i
    end
    out = "{\"Personnage\":"+per+",\"Capacites\":"+cap.to_json+", \"Historiques\":"+his.to_json
    if spheres != nil
      sph = {}
      spheres.each do |key, c|
        sph[key] = c[:niveau].to_i
      end
      out += ", \"Spheres\":"+sph.to_json
    end
    if disciplines != nil
      dis = {}
      disciplines.each do |key, c|
        if key.split("_")[0] == "t"
          hiss = Discipline.find(key.split("_")[1].to_i)
        else
          if is_dp(key)
            hisper = DisciplinesPersonnages.find(key)
            hiss = hisper.discipline
          else
            hiss = Discipline.find(key)
          end
        end
        dis[hiss.id] = c[:niveau].to_i
      end
      out += ", \"Disciplines\":"+dis.to_json
    end
    out += ", \"Volonte\":"+volonte.to_json
    out += ", \"Entelechie\":1" if mage?
    out += "}"
    out
  end

  private

  def is_cp(key)
    begin
      cap = CapacitesPersonnages.where(id: key, personnage_id: id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_hp(key)
    begin
      cap = HistoriquesPersonnages.where(id: key, personnage_id: id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_dp(key)
    begin
      cap = DisciplinesPersonnages.where(id: key, personnage_id: id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

end
