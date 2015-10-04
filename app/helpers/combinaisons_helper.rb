module CombinaisonsHelper
  def manage_niveau(discipline)
    cd = @combinaisons_disciplines.select{|cd| cd.discipline_id == discipline.id}
    if cd.count > 0
      value = cd.first.niveau
    else
      value = ""
    end
    out = "#{discipline.nom}"
    out += "<input class='numeric integer optional integer' id='combinaisons_disciplines_niveau' name='combinaisons_disciplines[#{discipline.id}][niveau]' type='number' value='#{value}'>"
    out.html_safe
  end
end
