module ApplicationHelper
  def input_secret(f, label)
    f.input(:secret, as: :boolean,
            label: "<div class=\"title-custom-checkbox\">#{label}</div><div class=\"custom-checkbox\"><input type=\"checkbox\" name=\"\" id=\"custom-checkbox-#{label[0]}\"><label for=\"custom-checkbox-#{label[0]}\"></label></div>".html_safe,
            wrapper_html: {class: 'inline'}, input_html: {class: 'hidden'})
  end

  def get_personnage(id)
    begin
      per = Personnage.find(id)
    rescue ActiveRecord::RecordNotFound => e
      per = nil
    end
    per
  end

  def get_organisation(id)
    begin
      org = Organisation.find(id)
    rescue ActiveRecord::RecordNotFound => e
      org = nil
    end
    org
  end

  def display_spheres(routine, perso=nil)
    list = ["correspondance", "entropie", "esprit", "forces", "matiere", "prime", "psyche", "temps", "vie"]
    out = ""
    list.each do |sph|
      if routine.send(sph) && routine.send(sph) > 0
        out << "#{routine.send(sph)}"
        out << "<span class='wod'>#{PersonnagesConstantes::FONT_WOD[sph]}</span>"
      end
    end
    out.html_safe
  end
end
