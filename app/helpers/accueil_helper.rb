module AccueilHelper
  def menu_accueil(tab, name_objet, list, titre)
    out = "<div id=\"menu-#{name_objet}\" class=\"menu-accueil\">".html_safe
    out << "<div class=\"menu-accueil-head\">".html_safe
    out << "10 derniers #{titre}".html_safe
    out << "</div>".html_safe
    out << "<div class=\"menu-accueil-body\">".html_safe
      if list != []
        out << "<table>".html_safe
          out << "<tr>".html_safe
            tab.each do |val|
              out << "<th>#{val}</th>".html_safe
            end
            out << "<th>Voir</th>".html_safe
          out << "</tr>".html_safe
          list.each do |a|
            out << "<tr>".html_safe
              tab.each do |val|
                out << "<td>#{a.send(val)}</td>".html_safe
              end
              if titre != "pnjs"
                out << "<td>#{link_to "Voir", a, class: 'btn btn-success btn-xs'}</td>".html_safe
              else
                out << "<td>#{link_to "Voir", public_show_personnage_path(a), class: 'btn btn-success btn-xs'}</td>".html_safe
              end
            out << "</tr>".html_safe
          end
        out << "</table>".html_safe
      end
    out << "</div>".html_safe
    out << "<div class=\"menu-accueil-action\">".html_safe
      if titre != "pnjs"
        out << link_to("Les #{titre}", send("#{name_objet}_path"), class: 'btn btn-primary btn-sm')
      else
        out << link_to("Les #{titre}", send("pnjs_#{name_objet}_path"), class: 'btn btn-primary btn-sm')
      end
    out << "</div>".html_safe
    out << "</div>".html_safe
    out
  end
end
