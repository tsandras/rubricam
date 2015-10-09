module PersonnagesShow

  def show_relations(relations)
    out = ""
    relations.each do |r|
      p1 = get_personnage(r.to_personnage_id)
      p2 = get_personnage(r.from_personnage_id)
      out = out + link_to("#{p1.prenom} #{p1.nom}", p1) + " #{r.name} " + link_to("#{p2.prenom} #{p2.nom}", p2)
    end
    out.html_safe
  end

  def show_routines(routines)
    if @personnage.mage?
      out = "<b>Routines "
      out += link_to('Editer routines', routine_edit_personnage_path(@personnage), class: 'btn btn-success btn-xs')
      out += "</b><br/>"
      if routines.count > 0
        routines.each do |r|
          out << link_to("#{r.name} (#{r.type_routine})", r) + " " + display_spheres(r, true) + "<br/>".html_safe
        end
      end
      out.html_safe
    end
  end

  def show_organisations(organisations)
    if organisations.count > 0
      out = "<b>Organisations</b><br/>"
      organisations.each do |o|
        out << link_to("#{o.nom} (#{o.type_organisation})", o) + "<br/>".html_safe
      end
      out.html_safe
    end
  end

  def show_lieus(lieus)
    if lieus.count > 0
      out = "<b>Lieux</b><br/>"
      lieus.each do |l|
        out << link_to("#{l.nom} (#{l.type_lieu})", l) + "<br/>".html_safe
      end
      out.html_safe
    end
  end

  def show_nbs_attributs(personnage)
    " (#{Personnage::BASE_BY_TYPE[personnage.type_perso].split(";")[0]})" if !personnage.has_base
  end

  def show_nbs_capacites(personnage)
    " (#{Personnage::BASE_BY_TYPE[personnage.type_perso].split(";")[1]})" if !personnage.has_base
  end

  def show_nbs_historiques(personnage)
    " <span id=\"nbs_historiques\">0</span>/<span id=\"max_historiques\">#{Personnage::BASE_BY_TYPE[personnage.type_perso].split(";")[2]}</span>" if !personnage.has_base
  end

  def show_nbs_physiques(personnage)
    "<span id=\"nbs_physique\"></span>".html_safe if !personnage.has_base
  end

  def show_nbs_vertues(personnage)
    " <span id=\"nbs_vertues\">0</span>/<span id=\"max_vertues\">5</span>".html_safe if !personnage.has_base && personnage.vampire?
  end

  def show_disciplines(personnage)
    " <span id=\"nbs_disciplines\">0</span>/<span id=\"max_disciplines\">4</span>".html_safe if !personnage.has_base && personnage.vampire?
  end

  def show_spheres_for_base(personnage)
    " <span id=\"nbs_spheres\">#{personnage.tradition == 'orphelins' ? '0' : '1'}</span>/<span id=\"max_spheres\">#{personnage.tradition == 'orphelins' ? '5' : '6'}</span>".html_safe if !personnage.has_base && personnage.mage?
  end

  def show_pts_bonus(personnage)
    " <span id=\"nbs_bonus\">0</span>/<span id=\"max_bonus\">#{personnage.bonus}</span>".html_safe
  end

  def nom_complet(personnage)
    "<b>#{personnage.prenom} #{personnage.nom}</b>".html_safe
  end

  def show_points_sang(personnage)
    if personnage.type_perso == "Vampire"
      niveau_gen = HistoriquesPersonnages.where(personnage_id: personnage.id, historique_id: Historique.where(nom: "Génération").first.id).first.niveau
      generation = 13 - niveau_gen
      "<b>Points de sang</b> : #{Personnage::POINTS_SANG[generation.to_s]}<br />".html_safe
    end
  end

  def show_tradition(personnage)
    if personnage.tradition.present?
      "- <i>#{personnage.tradition}</i>".html_safe
    end
  end

  def show_vertue(personnage)
    if personnage.has_vertues
      out = ""
      out += "<b>Vertues</b>"
      out += "<table>"
        out += "<tr>"
          out += "<td>Conscience : #{@personnage.points_conscience} </td>"
          out += "<td>Maitrise : #{@personnage.points_maitrise} </td>"
          out += "<td>Courage : #{@personnage.points_courage} </td>"
        out += "</tr>"
      out += "</table>"
      out += "<br />"
      out.html_safe
    end
  end

  def show_resonnance(personnage)
    if personnage.has_resonnances
      out = ""
      out += "<b>Resonnances</b>"
      out += "<table>"
        out += "<tr>"
          out += "<td>Dymamique : #{@personnage.points_dynamique} #{@personnage.detail_dynamique.present? ? "<i>(#{@personnage.detail_dynamique})</i>" : ""} </td>"
          out += "<td>Statique : #{@personnage.points_statique} #{@personnage.detail_statique.present? ? "<i>(#{@personnage.detail_statique})</i>" : ""} </td>"
          out += "<td>Entropique : #{@personnage.points_entropique} #{@personnage.detail_entropique.present? ? "<i>(#{@personnage.detail_entropique})</i>" : ""} </td>"
        out += "</tr>"
      out += "</table>"
      out += "<br />"
      out.html_safe
    end
  end

  def show_partie(personnage)
    infos = Personnage::BASE_BY_TYPE[personnage.type_perso].split(";")
    out = "".html_safe
    out << "<div class=\"partie-personnage\">".html_safe
    if !personnage.has_base
      out << "<b>ETAPE 1 : Répartition des points de départ</b><br/>".html_safe
      # out << "Vous jouez un #{personnage.type_perso} #{personnage.vampire? ? personnage.clan : personnage.tradition}.</br>".html_safe
      out << "Vous devez répartir #{infos[0]} points dans les Attributs.<br/>".html_safe
      out << "Vous devez répartir #{infos[1]} dans les Capacités.<br/>".html_safe
      out << "Vous devez répartir #{infos[2]} points dans les Historiques.<br/>".html_safe
      out << "Vous devez répartir 5 points dans les vertues ainsi que 4 points dans les Disciplines" if personnage.vampire?
      out << "Vous devez répartir #{personnage.tradition == 'Orphelins' ? '5' : '6'} points dans les Sphères." if personnage.mage?
    elsif !personnage.has_bonus
      out << "<b>ETAPE 2 : Répartition des points bonus</b>#{show_pts_bonus(personnage)}<br/>".html_safe
      out << "Vous devez répartir #{personnage.bonus} points.".html_safe
    else
      out << "<b>ETAPE 3 : Répartition des points d'expériences (ou pas)</b><br/>".html_safe
      out << "Ce personnage à un total de #{personnage.xps.to_i} dont <span id=\"reste_xps\">#{personnage.reste_xps.to_i}</span> non dépensés.".html_safe
    end
    out << "</div>".html_safe
    out
  end

  def show_kinain(personnage)
    if personnage.glamour.present?
      out = "Glamour : #{personnage.glamour}<br />"
      out += "Banalité : #{personnage.banalite}<br />"
      out.html_safe
    end
  end

  def show_capacite(capacites)
    if capacites != nil
      out = ""
      out += "<b>Capacités</b>"
      out += "<table>"
      tmp = 0
      capacites.each do |c|
        if c.niveau > 0
          if tmp % 3 == 0
            out += "<tr>"
          end
          tmp = tmp + 1
          out += "<td> #{c.capacite.nom} #{spec(c.specialite)} : #{c.niveau}</td>"
          if tmp % 3 == 0
            out += "</tr>"
          end
        end
      end
      out += "</table>"
      out += "<br />"
      out.html_safe
    end
  end

  def show_historique(historiques)
    if historiques != nil
      out = ""
      out += "<b>Historiques</b>"
      out += "<table>"
      tmp = 0
      historiques.each do |c|
          if tmp % 3 == 0
            out += "<tr>"
          end
          tmp = tmp + 1
          if !c.historique.has_detail
            out += "<td> #{c.historique.nom} #{c.niveau}</td>"
          else
            out += "<td> #{c.historique.nom} #{c.niveau} <i>(#{c.detail})</i></td>"
          end
          if tmp % 3 == 0
            out += "</tr>"
          end
      end
      out += "</table>"
      out += "<br />"
      out.html_safe
    end
  end

  def show_atout(atouts)
    if atouts != nil
      out = ""
      out += "<b>Atouts</b>"
      out += "<table>"
      tmp = 0
      atouts.each do |c|
          if tmp % 3 == 0
            out += "<tr>"
          end
          tmp = tmp + 1
          if !c.atout.has_detail
            out += "<td> #{c.atout.nom} (#{c.atout.cout})</td>"
          else
            out += "<td> #{c.atout.nom} (#{c.atout.cout}) <i>[#{c.detail}]</i></td>"
          end
          if tmp % 3 == 0
            out += "</tr>"
          end
      end
      out += "</table>"
      out += "<br />"
      out.html_safe
    end
  end

  def show_voie(personnage)
    if personnage.voie.present?
      "<b>#{personnage.voie}</b> : #{personnage.points_conscience + personnage.points_maitrise}<br />".html_safe
    end
  end

  def show_xps(personnage)
    out = ""
    out += "<b>Xps</b>"
    out += "<table>"
      out += "<tr>"
        out += "<td>Xps totaux : #{@personnage.xps} </td>"
        out += "<td>Pbs totaux : #{@personnage.bonus} </td>"
        out += "<td>Xps restant : #{@personnage.reste_xps} </td>"
      out += "</tr>"
    out += "</table>"
    out += "<br />"
    out.html_safe
  end

  def spec(spec)
    "<i>(#{spec})</i>".html_safe if spec.present?
  end

  def show_sauvegarder(f, personnage)
    if personnage.has_base.blank? && personnage.has_bonus.blank?
      f.button(:submit, "Sauvegarder base", class: 'btn btn-primary btn-sm')
    elsif personnage.has_bonus.blank?
      f.button(:submit, "Sauvegarder bonus", class: 'btn btn-primary btn-sm')
    else
      f.button(:submit, "Sauvegarder", class: 'btn btn-primary btn-sm')
    end
  end

  def show_spheres(personnage)
    if personnage.spheres.count != 0
      out = ""
      out += "<b>Spheres</b>"
      out += "<table>"
      tmp = 0
      personnage.spheres.each do |sphere|
        if sphere.niveau.present? && sphere.niveau > 0
          if tmp % 3 == 0
            out += "<tr>"
          end
          tmp = tmp + 1
          if sphere.niveau < 4
            out += "<td> #{sphere.name} #{sphere.niveau}</td>"
          else
            out += "<td> #{sphere.name} #{sphere.niveau} <i>(#{sphere.specialite})</i></td>"
          end
          if tmp % 3 == 0
            out += "</tr>"
          end
        end
      end
      out += "</table>"
      out += "<br />"
      out.html_safe
    end
  end

  def show_disciplines_all(personnage)
    if personnage.disciplines.count != 0
      out = ""
      out += "<b>Disciplines "
      out += "</b>"
      out += "<table>"
      tmp = 0
      personnage.disciplines.each do |discipline|
        disper = DisciplinesPersonnages.where(personnage_id: personnage.id, discipline_id: discipline.id).first
        if disper.niveau.present? && disper.niveau > 0
          if tmp % 3 == 0
            out += "<tr>"
          end
          tmp = tmp + 1
          out += "<td> #{discipline.nom} #{disper.niveau}</td>"
          if tmp % 3 == 0
            out += "</tr>"
          end
        end
      end
      out += "</table>"
      out += "<br />"
      out.html_safe
    end
  end

  def show_combinaisons_disciplines(personnage)
    if personnage.disciplines.count != 0
      comper = personnage.combinaisons
      out = ""
      out += "<b>Combinaisons Discipline </b>"
      out += "</b>"
      out += link_to('Combinaisons disciplines', combinaison_edit_personnage_path(@personnage), class: 'btn btn-success btn-xs')
      if comper.count > 0
        out += "<table>"
        tmp = 0
        comper.each do |com|
          if tmp % 3 == 0
            out += "<tr>"
          end
          tmp = tmp + 1
          out += "<td> #{com.nom} (#{com.cout})</td>"
          if tmp % 3 == 0
            out += "</tr>"
          end
        end
        out += "</table>"
        out.html_safe
      end
      out += "<br />"
      out.html_safe
    end
  end

  def show_advanced_disciplines(personnage)
    bool = false
    personnage.disciplines.each do |discipline|
      disper = DisciplinesPersonnages.where(personnage_id: personnage.id, discipline_id: discipline.id).first
      bool = true if disper.niveau > 5
    end
    if bool
      out = ""
      out += "<b>Disciplines avancées "
      out += link_to('Disciplines avancées', discipline_edit_personnage_path(@personnage), class: 'btn btn-success btn-xs')
      out += "</b>"
      out += "<table>"
      tmp = 0
      personnage.nivdisciplines.each do |nivdiscipline|
        if tmp % 3 == 0
          out += "<tr>"
        end
        tmp = tmp + 1
        out += "<td> #{nivdiscipline.nom} (#{nivdiscipline.discipline_nom} #{nivdiscipline.niveau})</td>"
        if tmp % 3 == 0
          out += "</tr>"
        end
      end
      out += "</table>"
      out += "<br />"
      out.html_safe
    end
  end

  def show_image_type(personnage)
    # if personnage.mage?
    #   name = I18n.transliterate(personnage.tradition.split(" ").join("_").split("'").join("")).downcase
    #   if name != "orphelins"
    #     image_tag("traditions/#{name}.jpg", class: "image-tradition")
    #   end
    # elsif personnage.vampire?
    #   name = I18n.transliterate(personnage.clan.split(" ").join("_").split("'").join("")).downcase
    #   image_tag("clans/#{name}.png", class: "image-clan")
    # end
    type = personnage.mage? ? personnage.tradition : personnage.clan
    name = I18n.transliterate(type.split(" ").join("_").split("'").join("")).downcase
    if name != "orphelins"
      image_tag("wod/#{name}.png", class: "image-clan")
    end
  end

  def show_image_perso

  end

  def show_clan(personnage)
    if personnage.clan.present?
      "- <i>#{personnage.clan}</i>".html_safe
    end
  end

  def show_entelechie(personnage)
    if personnage.type_perso =~ /Mage/i
      "<b>Entéléchie</b> : #{personnage.entelechie}<br />".html_safe
    end
  end
end
