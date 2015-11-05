module RoutinesHelper
  def input_spheres_for_routines(f, routine)
    out = "<p><b>Sphères nécessaires : </b></p>".html_safe
    tmp = 0
    list = ["correspondance", "entropie", "esprit", "forces", "matiere", "prime", "psyche", "temps", "vie"]
    list.each_with_index do |sphere, i|
      tmp = tmp + 1
      nom = Sphere::SPHERE[i]
      out << "<div class=\"row sph #{i % 2 == 0 ? 'gris' : ''}\" id=\"#{sphere}\">".html_safe
        out << "<div class=\"col-md-4\">".html_safe
          out << "<b> #{nom} </b>".html_safe
        out << "</div>".html_safe
        out << "<div class=\"col-md-2\">".html_safe
          out << button_tag('', type: 'button', id: "minus-#{sphere}", class: 'moins_new')
          out << button_tag('', type: 'button', id: "plus-#{sphere}", class: 'plus_new')
        out << "</div>".html_safe
        out << f.input(list[i], label: false,
                        input_html: { class: "inpt_number #{i % 2 == 0 ? 'gris' : ''}", readonly: 'true', value: routine.send(list[i]).present? ? routine.send(list[i]) : 0 },
                        wrapper_html: { class: 'col-md-1 reajuste' })
        # out << "<div class=\"col-md-5\"></div>".html_safe
      out << "</div>".html_safe
    end
    # out << "</div>".html_safe
    out.html_safe
  end

  def show_spheres_for_routines(routine)
    list = ["correspondance", "entropie", "esprit", "forces", "matiere", "prime", "psyche", "temps", "vie"]
    out = "<p><b>Liste des sphères:</b> ".html_safe
    list.each do |sphere|
      out << "#{sphere} (#{routine.send(sphere)}) ".html_safe if routine.send(sphere).present? && routine.send(sphere) > 0
    end
    out << "</p>".html_safe
    out
  end
end
