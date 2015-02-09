module PersonnagesHelper
  include PersonnagesInput
  include PersonnagesShow

  def local_date(date)
    return I18n.localize date.to_date if date.present?
    nil
  end

  def get_personnage(id)
    Personnage.find(id)
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
    out << f.association(:disciplines, as: :check_boxes, :collection => Discipline.all.map {|c| [c.nom, c.id]}.uniq,   wrapper_html: { class: 'col-md-12' })
    out << "</div>".html_safe
    out
  end

  def format_name(name)
    name.split(' ').join().split("'").join()
  end
end
