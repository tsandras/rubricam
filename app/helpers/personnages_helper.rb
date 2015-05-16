module PersonnagesHelper
  include PersonnagesInput
  include PersonnagesShow

  def local_date(date)
    return I18n.localize date.to_date if date.present?
    nil
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

  def recherche_capacite(f)
    out = "<div class=\"capacite\">".html_safe
    out << "<label for=\"search_capacite\"> Rechercher Capacite :</label>".html_safe
    out << " <input id=\"search_capacite\" type=\"text\" onkeypress=\"filter(this, '.capacite .checkbox .check_boxes')\" onkeyup=\" epurationCheckBox(this, '.capacite .checkbox .check_boxes')\" />".html_safe
    out << f.association(:capacites, as: :check_boxes, :collection => Capacite.all.map {|c| ["#{c.nom} - <i>#{c.type_cap}</i>".html_safe, c.id]}.uniq, wrapper_html: { class: 'col-md-12' })
    out << "</div>".html_safe
    out
  end

  def recherche_historique(f)
    out = "<div class=\"historique\">".html_safe
    out << "<label for=\"search_historique\"> Rechercher Historique :</label>".html_safe
    out << "<input id=\"search_historique\" type=\"text\" onkeypress=\"filter(this, '.historique .checkbox .check_boxes')\" onkeyup=\" epurationCheckBox(this, '.historique .checkbox .check_boxes')\" />".html_safe
    out << f.association(:historiques, as: :check_boxes, :collection => Historique.all.map {|c| [c.nom, c.id]}.uniq,   wrapper_html: { class: 'col-md-12' })
    out << "</div>".html_safe
    out
  end

  def recherche_atout(f)
    out = "<div class=\"atout\">".html_safe
    out << "<label for=\"search_atout\"> Rechercher Atout :</label>".html_safe
    out << "<input id=\"search_atout\" type=\"text\" onkeypress=\"filter(this, '.atout .checkbox .check_boxes')\" onkeyup=\" epurationCheckBox(this, '.atout .checkbox .check_boxes')\" />".html_safe
    out << f.association(:atouts, as: :check_boxes, :collection => Atout.all.map {|c| ["#{c.nom} (#{c.cout})", c.id]}.uniq, wrapper_html: { class: 'col-md-12' })
    out << "</div>".html_safe
    out
  end

  def recherche_discipline(f)
    out = "<div class=\"discipline\">".html_safe
    out << "<label for=\"search_discipline\"> Rechercher Discipline :</label>".html_safe
    out << "<input id=\"search_discipline\" type=\"text\" onkeypress=\"filter(this, '.discipline .checkbox .check_boxes')\" onkeyup=\" epurationCheckBox(this, '.discipline .checkbox .check_boxes')\" />".html_safe
    out << f.association(:disciplines, as: :check_boxes, label: "&nbsp;".html_safe,
                         :collection => Discipline.all.map {|c| [c.nom, c.id]}.uniq,
                         wrapper_html: { class: 'col-md-12' })
    out << "</div>".html_safe
    out
  end

  def input_modal_objet(f, type, nom)
    out = "<div id=\"openModal#{type}\" class=\"modalDialog\">".html_safe
      out << "<div><a href=\"#close\" title=\"Close\" class=\"close2\">X</a>".html_safe
          out << "<h2>#{nom}</h2>".html_safe
          if type == "discipline"
            out << recherche_discipline(f)
          elsif type == "atout"
            out << recherche_atout(f)
          elsif type == "historique"
            out << recherche_historique(f)
          else
            out << recherche_capacite(f)
          end
      out << "</div>".html_safe
    out << "</div>".html_safe
    out
  end

  def format_name(name)
    name.split(' ').join().split("'").join()
  end

  def manage_reset(personnage)
    if personnage.has_base && personnage.has_bonus && personnage.reste_xps != personnage.xps
      link_to 'Réinitialiser xps', reset_xps_personnage_path(@personnage), confirm: "C'est votre ultime bafouille ?", class: 'btn btn-info btn-sm'
    elsif personnage.has_base && personnage.has_bonus
      link_to 'Réinitialiser bonus', reset_bonus_personnage_path(@personnage), confirm: "C'est votre ultime bafouille ?", class: 'btn btn-info btn-sm'
    elsif personnage.has_base && !personnage.has_bonus
      link_to 'Réinitialiser base', reset_base_personnage_path(@personnage), confirm: "C'est votre ultime bafouille ?", class: 'btn btn-info btn-sm'
    end
  end
end
