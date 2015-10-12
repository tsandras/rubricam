module ObjetsHelper
  def label_niveau(niveau)
    if niveau == 0
      color = "label-default"
    elsif niveau > 0 && niveau < 3
      color = "label-info"
    elsif niveau > 2 && niveau < 5
      color = "label-success"
    elsif niveau > 4 && niveau < 7
      color = "label-warning"
    else
      color = "label-danger"
    end
    content_tag :span, niveau, class: "label #{color}"
  end
end
