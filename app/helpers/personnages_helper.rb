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
    out << f.association(:capacites, as: :check_boxes, label: "&nbsp;".html_safe, :collection => Capacite.all.map {|c| ["#{c.nom} - <i>#{c.type_cap}</i>".html_safe, c.id]}.uniq, wrapper_html: { class: 'col-md-12' })
    out << "</div>".html_safe
    out
  end

  def recherche_historique(f)
    out = "<div class=\"historique\">".html_safe
    out << "<label for=\"search_historique\"> Rechercher Historique :</label>".html_safe
    out << "<input id=\"search_historique\" type=\"text\" onkeypress=\"filter(this, '.historique .checkbox .check_boxes')\" onkeyup=\" epurationCheckBox(this, '.historique .checkbox .check_boxes')\" />".html_safe
    out << f.association(:historiques, as: :check_boxes, label: "&nbsp;".html_safe, :collection => Historique.all.map {|c| [c.nom, c.id]}.uniq,   wrapper_html: { class: 'col-md-12' })
    out << "</div>".html_safe
    out
  end

  def recherche_atout(f)
    out = "<div class=\"atout\">".html_safe
    out << "<label for=\"search_atout\"> Rechercher Atout :</label>".html_safe
    out << "<input id=\"search_atout\" type=\"text\" onkeypress=\"filter(this, '.atout .checkbox .check_boxes')\" onkeyup=\" epurationCheckBox(this, '.atout .checkbox .check_boxes')\" />".html_safe
    out << f.association(:atouts, as: :check_boxes, label: "&nbsp;".html_safe, :collection => Atout.all.map {|c| ["#{c.nom} (#{c.cout})", c.id]}.uniq, wrapper_html: { class: 'col-md-12' })
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

  def recherche_art(f)
    out = "<div class=\"artt\">".html_safe
    out << "<label for=\"search_art\"> Rechercher art :</label>".html_safe
    out << "<input id=\"search_art\" type=\"text\" onkeypress=\"filter(this, '.artt .checkbox .check_boxes')\" onkeyup=\" epurationCheckBox(this, '.artt .checkbox .check_boxes')\" />".html_safe
    out << f.association(:arts, as: :check_boxes, label: "&nbsp;".html_safe,
                         :collection => Art.all.map {|c| [c.nom, c.id]}.uniq,
                         wrapper_html: { class: 'col-md-12' })
    out << "</div>".html_safe
    out
  end

  # def input_modal_objet(f, type, nom)
  #   out = "<div id=\"openModal#{type}\" class=\"modalDialog\">".html_safe
  #     out << "<div><a href=\"#close\" title=\"Close\" class=\"close2\">X</a>".html_safe
  #         out << "<h2>#{nom}</h2>".html_safe
  #         if type == "discipline"
  #           out << recherche_discipline(f)
  #         elsif type == "atout"
  #           out << recherche_atout(f)
  #         elsif type == "historique"
  #           out << recherche_historique(f)
  #         else
  #           out << recherche_capacite(f)
  #         end
  #     out << "</div>".html_safe
  #   out << "</div>".html_safe
  #   out
  # end

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

  def activation(personnage, field)
    if personnage.send(field)
      content_tag :span, 'Oui', class: 'label label-success'
    else
      content_tag :span, 'Non', class: 'label label-default'
    end
  end

  def label_secret(personnage)
    if personnage.secret
      content_tag :span, 'Secret', class: 'label label-warning'
    else
      content_tag :span, 'Publique', class: 'label label-info'
    end
  end

  def label_pnj(personnage)
    if personnage.pnj
      content_tag :span, 'PNJ', class: 'label label-default'
    else
      content_tag :span, 'PJ', class: 'label label-success'
    end
  end

  def label_rang(personnage)
    color = ""
    if personnage.name_rang == 'S'
      color = "label-danger"
    elsif personnage.name_rang == 'A'
      color = "label-warning"
    elsif personnage.name_rang == 'B'
      color = "label-success"
    elsif personnage.name_rang == 'C'  
      color = "label-info"
    else
      color = "label-default"
    end
    content_tag :span, personnage.name_rang, class: "label #{color}"
  end

  def label_rang_publique(personnage)
    color = ""
    if personnage.rang_publique == 'S'
      color = "label-danger"
    elsif personnage.rang_publique == 'A'
      color = "label-warning"
    elsif personnage.rang_publique == 'B'
      color = "label-success"
    elsif personnage.rang_publique == 'C'  
      color = "label-info"
    else
      color = "label-default"
    end
    content_tag :span, personnage.rang_publique, class: "label #{color}"
  end
end
