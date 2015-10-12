module PartiesHelper
  def label_duree(duree)
    if duree < 4
      color = "label-info"
    elsif duree < 6
      color = "label-success"
    elsif duree < 8
      color = "label-success"
    else
      color = "label-danger"
    end
    content_tag :span, "#{duree} heures", class: "label #{color}"
  end
end
