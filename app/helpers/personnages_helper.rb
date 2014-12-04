module PersonnagesHelper
  def local_date(date)
    return I18n.localize date.to_date if date.present?
    nil
  end

  def get_personnage(id)
    Personnage.find(id)
  end

  def show_relations(relations)
    out = ""
    relations.each do |r|
      p1 = get_personnage(r.to_personnage_id)
      p2 = get_personnage(r.from_personnage_id)
      out = out + link_to(p1.nom, p1) + " #{r.name} de/avec " + link_to(p2.nom, p2)
    end
    out.html_safe
  end

  def show_points_sang(personnage)
    if personnage.type_perso == "Vampire"
      "Points de sang : #{personnage.points_sang}<br />".html_safe
    end
  end

  def input_points_sang(f, perso)
    if perso.type_perso == "Vampire" || perso.type_perso == nil
      f.input :points_sang
    end
  end

  def show_entelechie(personnage)
    if personnage.type_perso =~ /Mage/i
      "Entelechie : #{personnage.entelechie}<br />".html_safe
    end
  end

  def input_entelechie(f, perso)
    if perso.type_perso =~ /Mage/i || perso.type_perso == nil
      f.input :entelechie
    end
  end

  def show_tradition(personnage)
    if personnage.tradition.present?
      "- <i>#{personnage.tradition}</i>".html_safe
    end
  end

  def input_tradition(f, perso)
    if perso.type_perso =~ /Mage/i
      f.input(:tradition, collection: Personnage::TRADITION)
    end
  end

  def show_clan(personnage)
    if personnage.clan.present?
      "- <i>#{personnage.clan}</i>".html_safe
    end
  end

  def input_clan(f, perso)
    if perso.type_perso == "Vampire"
      f.input(:clan, collection: Personnage::CLAN)
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

  def input_vertue(f, personnage)
    if personnage.type_perso == "Vampire" || personnage.has_vertues
      "<div class='col-md-12'><b>Vertue</b></div>".html_safe <<
      f.input(:points_conscience, label: "Conscience", wrapper_html: { class: 'col-md-4' }) <<
      f.input(:points_maitrise, label: "Maîtrise de soi", wrapper_html: { class: 'col-md-4' }) <<
      f.input(:points_courage, label: "Courage", wrapper_html: { class: 'col-md-4' })
    end
  end

  def show_resonnance(personnage)
    if personnage.has_resonnances
      out = ""
      out += "<b>Resonnances</b>"
      out += "<table>"
        out += "<tr>"
          out += "<td>Dymamique : #{@personnage.points_dynamique} </td>"
          out += "<td>Statique : #{@personnage.points_statique} </td>"
          out += "<td>Entropique : #{@personnage.points_entropique} </td>"
        out += "</tr>"
      out += "</table>"
      out += "<br />"
      out.html_safe
    end
  end

  def input_resonnance(f, personnage)
    if personnage.type_perso =~ /Mage/i || personnage.has_resonnances
      "<div class='col-md-12'><b>Résonnance</b></div>".html_safe <<
      f.input(:points_dynamique, label: "Dymanique", wrapper_html: { class: 'col-md-4' }) <<
      f.input(:points_statique, label: "Statique", wrapper_html: { class: 'col-md-4' }) <<
      f.input(:points_entropique, label: "Entropique", wrapper_html: { class: 'col-md-4' })
    end
  end

  def input_kinain(f, personnage)
    if personnage.type_perso =~ /Kinain/i
      f.input(:glamour) <<
      f.input(:banalite)
    end
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
          if tmp % 3 == 0
            out += "<tr>"
          end
          tmp = tmp + 1
          out += "<td> #{c.capacite.nom} #{spec(c.specialite)} : #{c.niveau}</td>"
          if tmp % 3 == 0
            out += "</tr>"
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
          out += "<td> #{c.historique.nom} : #{c.niveau}</td>"
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
          out += "<td> #{c.atout.nom} (#{c.atout.cout})</td>"
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
      "#{personnage.voie} : #{personnage.niveau_voie}<br />".html_safe
    end
  end

  def input_voie(f, personnage)
    if personnage.type_perso == "Vampire"
      f.input(:voie, collection: Personnage::VOIE, wrapper_html: { class: 'col-md-10' }) <<
      f.input(:niveau_voie, label: "Niveau", wrapper_html: { class: 'col-md-2' })
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
      f.button(:submit, "Sauvegarder base", class: 'btn-primary btn-primary')
    elsif personnage.has_bonus.blank?
      f.button(:submit, "Sauvegarder bonus", class: 'btn-primary btn-primary')
    else
      f.button(:submit, "Sauvegarder", class: 'btn-primary btn-primary')
    end
  end

  def input_spheres(personnage)
    out = "<div class=\"sphere\">".html_safe
    out << "<div class=\"row\">".html_safe
    out << "<p><b>Spheres</b></p>".html_safe
    (0..8).each do |i|
      nom = Sphere::SPHERE[i]
      # raise personnage.id.inspect
      if has_sphere(nom, personnage)
        sphere = Sphere.where(name: nom, personnage_id: personnage.id).first
      else
        sphere = Sphere.create(name: nom)
      end
      out << simple_fields_for(sphere) do |s|
        "<div class='col-md-4'><b>#{nom}</b></div>".html_safe <<
        s.input(:niveau, label: "Niveau", input_html: { id: 'spheres_personnages_niveau', name: "spheres_personnages[#{sphere.id}][niveau]" }, wrapper_html: { class: 'col-md-2' }) <<
        s.input(:specialite, label: "Specialite", input_html: { id: 'spheres_personnages_specialite', name: "spheres_personnages[#{sphere.id}][specialite]" }, wrapper_html: { class: 'col-md-6' })
      end
    end
    out << "</div>".html_safe
    out << "</div>".html_safe
    out.html_safe
  end

  def show_spheres(personnage)
    if personnage.spheres.count != 0
      out = ""
      out += "<b>Spheres</b>"
      out += "<table>"
      tmp = 0
      personnage.spheres.each do |sphere|
        if sphere.niveau.present?
          if tmp % 3 == 0
            out += "<tr>"
          end
          tmp = tmp + 1
          out += "<td> #{sphere.name} #{sphere.niveau}</td>"
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

  def has_sphere(nom, personnage)
    begin
      return false if personnage.id.blank?
      cap = Sphere.where(name: nom, personnage_id: personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def input_discipline(f, disciplines)
    out = "<div class=\"discipline\">".html_safe
    out << "<label for=\"search_discipline\"> Rechercher Discipline :</label>".html_safe
    out << "<input id=\"search_discipline\" type=\"text\" onkeypress=\"filter(this, '.discipline .checkbox .check_boxes')\" onkeyup=\" epurationCheckBox(this, '.discipline .checkbox .check_boxes')\" />".html_safe
    out << f.association(:disciplines, as: :check_boxes, :collection => Discipline.all.map {|c| [c.nom, c.id]}.uniq,   wrapper_html: { class: 'col-md-12' })
    out << "</div>".html_safe
    out << "<div class=\"row\">".html_safe
    out << "<div class=\"dis\">".html_safe
    out << "</div>".html_safe
    if disciplines != nil
      disciplines.each do |cc|
        out << "<div class=\"dis\" id=\"f_#{cc.discipline.nom}\">".html_safe
        simple_fields_for(cc) do |c|
          out << "<div class=\"col-md-6\">".html_safe
          out << "<b>= #{cc.discipline.nom} </b>".html_safe
          out << "</div>".html_safe
          out << c.input(:niveau, input_html: {name: "disciplines_personnages[#{cc.id}][niveau]"}, wrapper_html: { class: 'col-md-6' })
          out << "<span class=\"hidden\" id=\"<%= cc.id\">#{cc.discipline.id}</span>".html_safe
          out << "</div>".html_safe
        end
      end
    end
    out << "</div>".html_safe
    out
  end
end
