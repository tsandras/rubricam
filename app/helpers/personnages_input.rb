module PersonnagesInput

  def input_tradition(f)
    out = "<div class=\"ss-type-reel\">".html_safe
    out << f.input(:tradition, collection: Personnage::TRADITION)
    out << "</div>".html_safe
    out
  end

  def input_clan(f)
    out = "<div class=\"ss-type-reel\">".html_safe
    out << f.input(:clan, collection: Personnage::CLAN)
    out << "</div>".html_safe
    out
  end

  def input_voie(f, personnage)
    if personnage.vampire?
      out = "<div class=\"row voie\">".html_safe
      out << "<div class='col-md-2'><b>Voie</b></div>".html_safe
      out << f.input(:voie, label: false, collection: Personnage::VOIE, wrapper_html: { class: 'col-md-8' })
      out << "<div class=\"col-md-2\" id=\"niveau-voie\">#{personnage.points_conscience+personnage.points_maitrise}</div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_entelechie(f, personnage)
    if personnage.mage? || personnage.type_perso == nil
      out = "<div class=\"row entelechie\">".html_safe
      out << "<div class='col-md-5'><b>Entéléchie</b></div>".html_safe
      out << "<div class='col-md-2'>".html_safe
        out << button_tag('', type: 'button', id: "minus-entelechie", class: 'moins_new')
        out << button_tag('', type: 'button', id: "plus-entelechie", class: 'plus_new')
      out << "</div>".html_safe
      out << f.input(:entelechie, label: false, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: {class: 'col-md-1'})
      out << "<div class=\"col-md-4\"></div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_points_sang(f, personnage)
    if personnage.goule?
      out = "<div class=\"row points_sang\">".html_safe
      out << "<div class='col-md-5'><b>Points de sang</b></div>".html_safe
      out << "<div class='col-md-2'>".html_safe
        out << button_tag('', type: 'button', id: "minus-points_sang", class: 'moins_new')
        out << button_tag('', type: 'button', id: "plus-points_sang", class: 'plus_new')
      out << "</div>".html_safe
      out << f.input(:points_sang, label: false, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: {class: 'col-md-1'})
      out << "<div class=\"col-md-4\"></div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_vertue(f, personnage)
    if personnage.vampire? || personnage.has_vertues
      out = "<div class=\"row vertue\">".html_safe
      out << "<div class='col-md-5'><b>Conscience</b></div>".html_safe
      out << "<div class='col-md-2'>".html_safe
        out << button_tag('', type: 'button', id: "minus-conscience", class: 'moins_new')
        out << button_tag('', type: 'button', id: "plus-conscience", class: 'plus_new')
      out << "</div>".html_safe
      out << f.input(:points_conscience, label: false, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: { class: 'col-md-1' })
      out << "<div class=\"col-md-4\"></div>".html_safe
      out << "</div>".html_safe

      out <<"<div class=\"row vertue\">".html_safe
      out << "<div class='col-md-5'><b>Maîtrise de soi</b></div>".html_safe
      out << "<div class='col-md-2'>".html_safe
        out << button_tag('', type: 'button', id: "minus-maitrise", class: 'moins_new')
        out << button_tag('', type: 'button', id: "plus-maitrise", class: 'plus_new')
      out << "</div>".html_safe
      out << f.input(:points_maitrise, label: false, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: { class: 'col-md-1' })
      out << "<div class=\"col-md-4\"></div>".html_safe
      out << "</div>".html_safe

      out <<"<div class=\"row vertue\">".html_safe
      out << "<div class='col-md-5'><b>Courage</b></div>".html_safe
      out << "<div class='col-md-2'>".html_safe
        out << button_tag('', type: 'button', id: "minus-courage", class: 'moins_new')
        out << button_tag('', type: 'button', id: "plus-courage", class: 'plus_new')
      out << "</div>".html_safe
      out << f.input(:points_courage, label: false, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: { class: 'col-md-1' })
      out << "<div class=\"col-md-4\"></div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_resonnance(f, personnage)
    out = "<div class=\"row resonnance\">".html_safe
    out << "<div class='col-md-5'><b>Dynamique</b></div>".html_safe
    out << "<div class=\"col-md-2\">".html_safe
      out << button_tag('', type: 'button', id: "minus-dynamique", class: 'moins_new')
      out << button_tag('', type: 'button', id: "plus-dynamique", class: 'plus_new')
    out << "</div>".html_safe
    out << f.input(:points_dynamique, label: false, input_html: {class: 'inpt_number', readonly: 'true', value: personnage.points_dynamique ? personnage.points_dynamique : 0}, wrapper_html: { class: 'col-md-1' })
    out << f.input(:detail_dynamique, label: false, input_html: { class: 'spe' }, wrapper_html: { class: 'col-md-4' })
    out << "</div>".html_safe

    out <<"<div class=\"row resonnance\">".html_safe
    out << "<div class='col-md-5'><b>Statique</b></div>".html_safe
    out << "<div class=\"col-md-2\">".html_safe
      out << button_tag('', type: 'button', id: "minus-statique", class: 'moins_new')
      out << button_tag('', type: 'button', id: "plus-statique", class: 'plus_new')
    out << "</div>".html_safe
    out << f.input(:points_statique, label: false, input_html: {class: 'inpt_number', readonly: 'true', value: personnage.points_statique ? personnage.points_statique : 0}, wrapper_html: { class: 'col-md-1' })
    out << f.input(:detail_statique, label: false, input_html: { class: 'spe' }, wrapper_html: { class: 'col-md-4' })
    out << "</div>".html_safe

    out <<"<div class=\"row resonnance\">".html_safe
    out << "<div class='col-md-5'><b>Entropique</b></div>".html_safe
    out << "<div class=\"col-md-2\">".html_safe
      out << button_tag('', type: 'button', id: "minus-entropique", class: 'moins_new')
      out << button_tag('', type: 'button', id: "plus-entropique", class: 'plus_new')
    out << "</div>".html_safe
    out << f.input(:points_entropique, label: false, input_html: {class: 'inpt_number', readonly: 'true', value: personnage.points_entropique ? personnage.points_entropique : 0}, wrapper_html: { class: 'col-md-1' })
    out << f.input(:detail_entropique, label: false, input_html: { class: 'spe' }, wrapper_html: { class: 'col-md-4' })
    out << "</div>".html_safe
    out
  end

  def input_volonte(f)
    out = "<div class=\"row volonte\">".html_safe
    out << "<div class='col-md-5'><b>Volonté</b></div>".html_safe
    out << "<div class=\"col-md-2\">".html_safe
      out << button_tag('', type: 'button', id: "minus-volonte", class: 'moins_new')
      out << button_tag('', type: 'button', id: "plus-volonte", class: 'plus_new')
    out << "</div>".html_safe
    out << f.input(:volonte, label: false, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: {class: 'col-md-1'})
    out << "<div class=\"col-md-4\"></div>".html_safe
    out << "</div>".html_safe
    out
  end

  def input_attribut(f, personnage, name, affichage, num)
    out = "<div class=\"row #{num % 2 == 0 ? 'gris' : ''}\">".html_safe
      out << "<div class=\"col-md-5\">".html_safe
        out << "<b> #{affichage} </b>".html_safe
        out << popover(Personnage::ATTRIBUT_DESC, name)
      out << "</div>".html_safe
      out << "<div class=\"col-md-2\">".html_safe
        out << button_tag('', type: 'button', id: "minus-#{name}", class: 'moins_new')
        out << button_tag('', type: 'button', id: "plus-#{name}", class: 'plus_new')
      out << "</div>".html_safe
      if personnage.send("#{name}").present?
        out << f.input("#{name}", label: false,
                input_html: { class: "inpt_number #{num % 2 == 0 ? 'gris' : ''}", readonly: 'true' },
                wrapper_html: { class: 'col-md-1' })
      else
        out << f.input("#{name}", label: false,
                input_html: { class: "inpt_number #{num % 2 == 0 ? 'gris' : ''}", value: 1, readonly: 'true' },
                wrapper_html: { class: 'col-md-1' })
      end
      if personnage.send("#{name}").blank? || personnage.send("#{name}") < 4
        out << f.input("spec_#{name}", label: false,
                input_html: { class: 'spe' },
                wrapper_html: { class: 'hidden col-md-4', id: "specialite-#{name}" })
      else
        out << f.input("spec_#{name}", label: false,
                input_html: { class: 'spe' },
                wrapper_html: { class: "col-md-4", id: "specialite-#{name}" })
      end
    out << "</div>".html_safe
    out
  end

  def input_spheres(personnage)
    out = ""
    tmp = 0
    (0..8).each do |i|
      if tmp % 3 == 0
        out << "<div class=\"col-md-4\">".html_safe
      end
      tmp = tmp + 1
      nom = Sphere::SPHERE[i]
      if @values_spheres.present? && @values_spheres[nom].present?
        sphere = @values_spheres[nom]
      elsif has_sphere(nom, personnage)
        sphere = Sphere.where(name: nom, personnage_id: personnage.id).first
      else
        sphere = Sphere.create(name: nom)
      end
      out << "<div class=\"row sph #{i % 3 == 0 || i == 2 || i == 5 || i == 8 ? 'gris' : ''}\" id=\"#{nom}\">".html_safe
        out << "<div class=\"col-md-5\">".html_safe
          out << "<b> #{nom} </b>".html_safe
          out << popover(Sphere::SPHERE_DESCRIPTION, nom)
        out << "</div>".html_safe
        out << "<div class=\"col-md-2\">".html_safe
          out << button_tag('', type: 'button', id: "minus-#{nom}", class: 'moins_new')
          out << button_tag('', type: 'button', id: "plus-#{nom}", class: 'plus_new')
        out << "</div>".html_safe
      simple_fields_for(sphere) do |s|
        out << s.input(:niveau, label: false, input_html: { class: "inpt_number #{i % 3 == 0 || i == 2 || i == 5 || i == 8 ? 'gris' : ''}", id: 'spheres_personnages_niveau', name: "spheres_personnages[#{sphere.id}][niveau]", readonly: 'true', value: sphere.niveau.present? ? sphere.niveau : 0 }, wrapper_html: { class: 'col-md-1' })
        if sphere.niveau.blank? || sphere.niveau < 4
          out << s.input(:specialite, label: false, input_html: { class: 'spe', id: 'inpt_string', name: "spheres_personnages[#{sphere.id}][specialite]" }, wrapper_html: { class: 'hidden col-md-4', id: "specialite-#{sphere.name}" })
        else
          out << s.input(:specialite, label: false, input_html: { class: 'spe', id: 'inpt_string', name: "spheres_personnages[#{sphere.id}][specialite]" }, wrapper_html: { class: "col-md-4", id: "specialite-#{sphere.name}" })
        end
      end
      out << "</div>"
      if tmp % 3 == 0
        out << "</div>".html_safe
      end
    end
    out.html_safe
  end

  def popover(list, nom, description=nil)
    if description.nil?
      out = "<button type=\"button\" class=\"btn btn-success btn-xs xxs popover-perso\" data-toggle=\"popover\" data-placement=\"top\" data-trigger=\"focus\" data-content=\"#{list["#{nom}"]}\" title=\"#{nom}\">?</button>".html_safe
    else
      out = "<button type=\"button\" class=\"btn btn-success btn-xs xxs popover-perso\" data-toggle=\"popover\" data-placement=\"top\" data-trigger=\"focus\" data-content=\"#{description}\"\">?</button>".html_safe
    end
  end

  # Methode for disciplines, capacites, historiques, atouts
  def input_data(objet, type, class_type, nom, format_nom, num, info_bulle=nil, cols_sup=nil, image=nil)
    out = "<div class=\"row #{class_type} #{num % 2 == 0 ? 'gris' : ''}\" id=\"f_#{format_nom}\">".html_safe
      out << "<div class=\"col-md-5\">".html_safe
        out << "<b> #{objet.send(type).nom} </b>".html_safe
        out << popover(nil, nil, info_bulle) if info_bulle != nil
      out << "</div>".html_safe
      out << "<div class=\"col-md-2\">".html_safe
        out << button_tag('', type: 'button', id: "minus-#{format_nom}", class: 'moins_new') if type != "atout"
        out << button_tag('', type: 'button', id: "plus-#{format_nom}", class: 'plus_new') if type != "atout"
      out << "</div>".html_safe
      simple_fields_for(objet) do |o|
        if type != "atout"
          out << o.input(:niveau, label: false,
                input_html: {name: "#{type}s_personnages[#{objet.id}][niveau]", class: "inpt_number #{num % 2 == 0 ? 'gris' : ''}", readonly: 'true' },
                wrapper_html: { class: "col-md-1" })
        else
          out << "<div class=\"col-md-1\">#{objet.atout.cout}</div>".html_safe
        end
        if cols_sup != nil
          out << o.input(cols_sup, label: false,
                  input_html: {class: "spe", name: "#{type}s_personnages[#{objet.id}][#{cols_sup}]"},
                  wrapper_html: { class: "col-md-4 #{specialite_affichage(objet, cols_sup)}", id: "#{cols_sup}-#{format_nom}" })
        else
          out << "<div class=\"col-md-4\"></div>".html_safe
        end
      end
      if type == "capacite"
        out << "<span class=\"hidden\" id=\"#{objet.id}\"> #{objet.capacite.id}:#{objet.capacite.type_cap}</span>".html_safe
      else
        out << "<span class=\"hidden\" id=\"#{class_type[0]}_#{objet.id}\">#{objet.send(type).id}</span>".html_safe
      end
    out << "</div>".html_safe
    out
  end

  def input_atout(atouts_personnages)
    out = "<p class=\"text-center\"><b>Atouts</b> ".html_safe
    out << "<button type=\"button\" class=\"btn btn-primary btn-xs\" data-toggle=\"modal\" data-target=\"#modal-atouts\">Ajouter des atouts</button>".html_safe
    out << "</p>".html_safe
    out << "<table id=\"table-atout\" class=\"table ato\">".html_safe
    out << "<head>".html_safe
    out << "<tr>".html_safe
      out << "<th>Nom</th>".html_safe
      out << "<th>Coût</th>".html_safe
      out << "<th>Détail</th>".html_safe
    out << "</tr>".html_safe
    out << "</head>".html_safe
    out << "<tbody>".html_safe
    if atouts_personnages != nil
      i = 0
      atouts_personnages.each do |cc|
        out << "<tr>".html_safe
          out << "<td>#{cc.atout.nom} ".html_safe
            out << popover(nil, nil, cc.atout.description) if cc.atout.description != nil
          out << "</td>".html_safe
          out << "<td>#{cc.atout.cout}</td>".html_safe
          out << "<td>".html_safe
          if cc.atout.has_detail
            simple_fields_for(cc) do |o|
              out << o.input("detail", label: false,
                    input_html: {class: "spe", name: "atouts_personnages[#{cc.id}][detail]"},
                    wrapper_html: { class: "col-md-4 #{specialite_affichage(cc, 'detail')}", id: "detail-#{format_name(cc.atout.nom)}" })
            end
          end
          out << "</td>".html_safe
        out << "</tr>".html_safe
        i = i + 1
      end
    end
    out << "</tbody>".html_safe
    out << "</table>".html_safe
    out
  end

  def specialite_affichage(objet, cols_sup)
    return "hidden" if cols_sup == "specialite" && (objet.niveau.blank? || objet.niveau < 4)
    ""
  end

  def input_attributs(f, personnage)
    out = "<div class=\"col-md-4\">".html_safe
      out << "<p class=\"text-center\"><b>Physique</b>#{show_nbs_physique(personnage)}</p>".html_safe
      out << input_attribut(f, personnage, "force", "Force", 0)
      out << input_attribut(f, personnage, "dexterite", "Dextérité", 1)
      out << input_attribut(f, personnage, "vigueur", "Vigueur", 2)
      out << "</div>".html_safe
    out << "<div class=\"col-md-4\">".html_safe
      out << "<p class=\"text-center\"><b>Social</b>#{show_nbs_social(personnage)}</p>".html_safe
      out << input_attribut(f, personnage, "charisme", "Charisme", 0)
      out << input_attribut(f, personnage, "manipulation", "Manipulation", 1)
      out << input_attribut(f, personnage, "apparence", "Apparence", 2)
    out << "</div>".html_safe
    out << "<div class=\"col-md-4\">".html_safe
      out << "<p class=\"text-center\"><b>Mental</b>#{show_nbs_mental(personnage)}</p>".html_safe
      out << input_attribut(f, personnage, "perception", "Perception", 0)
      out << input_attribut(f, personnage, "intelligence", "Intelligence", 1)
      out << input_attribut(f, personnage, "astuce", "Astuce", 2)
    out << "</div>".html_safe
    out
  end

  def show_nbs_physique(personnage)
    " <span id=\"nbs_physique\"> 0</span>" if !personnage.has_base
  end

  def show_nbs_social(personnage)
    " <span id=\"nbs_social\"> 0</span>" if !personnage.has_base
  end

  def show_nbs_mental(personnage)
    " <span id=\"nbs_mental\"> 0</span>" if !personnage.has_base
  end

  # To do: FIX bug when there are nom like "Force d'âme"
  def input_discipline(disciplines)
    out_final = "".html_safe
    out_col_un = "<div class=\"col-md-4 col-dis-0\">".html_safe
    out_col_deux = "<div class=\"col-md-4 col-dis-1\">".html_safe
    out_col_trois = "<div class=\"col-md-4 col-dis-2\">".html_safe
    i = 0
    gris = 0
    if disciplines != nil
      disciplines.each do |cc|
        cc.niveau = @values_disciplines[cc.id] if @values_disciplines.present? && @values_disciplines[cc.id].present?
        out = input_data(cc, "discipline", "dis", cc.discipline.nom, format_name(cc.discipline.nom), gris, cc.discipline.description)
        if i % 3 == 0
          out_col_un << out
        elsif i % 3 == 1
          out_col_deux << out
        else
          out_col_trois << out
        end
        i = i + 1
        if i % 3 == 0
          if gris == 0
            gris = 1
          else
            gris = 0
          end
        end
      end
    end
    out_final << out_col_un << "</div>".html_safe << out_col_deux << "</div>".html_safe << out_col_trois << "</div>".html_safe
    out_final
  end

  def input_royaume(royaumes_personnages)
    out = "".html_safe
    royaumes_personnages.each_with_index do |rp, i|
      out << input_data(rp, "royaume", "roy", rp.royaume.nom, format_name(rp.royaume.nom), i % 2)
    end
    out
  end

  def input_art(arts_personnages)
    out_final = "".html_safe
    out_col_un = "<div class=\"col-md-4 col-art-0\">".html_safe
    out_col_deux = "<div class=\"col-md-4 col-art-1\">".html_safe
    out_col_trois = "<div class=\"col-md-4 col-art-2\">".html_safe
    i = 0
    gris = 0
    if arts_personnages != nil
      arts_personnages.each do |cc|
        cc.niveau = @values_disciplines[cc.id] if @values_disciplines.present? && @values_disciplines[cc.id].present?
        out = input_data(cc, "art", "art", cc.art.nom, format_name(cc.art.nom), gris, cc.art.description)
        if i % 3 == 0
          out_col_un << out
        elsif i % 3 == 1
          out_col_deux << out
        else
          out_col_trois << out
        end
        i = i + 1
        if i % 3 == 0
          if gris == 0
            gris = 1
          else
            gris = 0
          end
        end
      end
    end
    out_final << out_col_un << "</div>".html_safe << out_col_deux << "</div>".html_safe << out_col_trois << "</div>".html_safe
    out_final
  end

  def input_type_changelin(f, personnage)
    if personnage.changelin? && !personnage.has_base
      out = "<div class='type-changelin'>".html_safe
      out += f.input :type_changelin,
        as: :radio_buttons,
        collection: Personnage::TYPE_CHANGELIN,
        label: false,
        item_wrapper_class: 'options-block'
      out += "</div>".html_safe
      out
    end
  end

  def input_glamour(f, personnage)
    if personnage.changelin? || personnage.kinain?
      out = "<div class=\"row glamour\">".html_safe
      out << "<div class='col-md-5'><b>Glamour</b></div>".html_safe
      out << "<div class=\"col-md-2\">".html_safe
        out << button_tag('', type: 'button', id: "minus-glamour", class: 'moins_new')
        out << button_tag('', type: 'button', id: "plus-glamour", class: 'plus_new')
      out << "</div>".html_safe
      out << f.input(:glamour, label: false, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: {class: 'col-md-1'})
      out << "<div class=\"col-md-4\"></div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_banalite(f, personnage)
    if personnage.changelin?
      out = "<div class=\"row banalite\">".html_safe
      out << "<div class='col-md-5'><b>Banalité</b></div>".html_safe
      out << "<div class=\"col-md-2\">".html_safe
        out << button_tag('', type: 'button', id: "minus-banalite", class: 'moins_new')
        out << button_tag('', type: 'button', id: "plus-banalite", class: 'plus_new')
      out << "</div>".html_safe
      out << f.input(:banalite, label: false, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: {class: 'col-md-1'})
      out << "<div class=\"col-md-4\"></div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_capacite(capacites_personnages, personnage)
    out = "".html_safe
    talent = "<div class=\"col-md-4 Talent\"><p class=\"text-center\"><b>Talents</b>#{show_nbs_talent(personnage)}</p>".html_safe
    competence = "<div class=\"col-md-4 Compétence\"><p class=\"text-center\"><b>Compétences</b>#{show_nbs_competences(personnage)}</p>".html_safe
    connaissance = "<div class=\"col-md-4 Connaissance\"><p class=\"text-center\"><b>Connaissances</b>#{show_nbs_connaissances(personnage)}</p>".html_safe
    if capacites_personnages != nil && capacites_personnages.count > 0
      i = 0
      capacites_personnages.each do |cc|
        cc.niveau = @values_capacites[cc.id] if @values_capacites.present? && @values_capacites[cc.id].present?
        tmp_out = input_data(cc, "capacite", "cap", cc.capacite.nom, format_name(cc.capacite.nom), i, cc.capacite.description, "specialite")
        if cc.capacite.type_cap == "Talent"
          talent << tmp_out
        elsif cc.capacite.type_cap == "Compétence"
          competence << tmp_out
        else
          connaissance << tmp_out
        end
        i = i + 1
      end
    else
      talent << "<div class=\"cap\"></div>".html_safe
      competence << "<div class=\"cap\"></div>".html_safe
      connaissance << "<div class=\"cap\"></div>".html_safe
    end
    talent << "</div>".html_safe
    competence << "</div>".html_safe
    connaissance << "</div>".html_safe
    out << talent << competence << connaissance
    out
  end

  def show_nbs_talent(personnage)
    " <span id=\"nbs_talents\"> 0</span>" if !personnage.has_base
  end

  def show_nbs_competences(personnage)
    " <span id=\"nbs_competences\"> 0</span>" if !personnage.has_base
  end

  def show_nbs_connaissances(personnage)
    " <span id=\"nbs_connaissances\"> 0</span>" if !personnage.has_base
  end

  def input_historique(historiques_personnages, personnage)
    out = "<div>".html_safe
    out << "<p class=\"text-center his\"><b>Historiques</b>#{show_nbs_historiques(personnage)} ".html_safe
    out << "<button type=\"button\" class=\"btn btn-primary btn-xs\" data-toggle=\"modal\" data-target=\"#modal-historiques\">Ajouter des historiques</button>".html_safe
    out << "</p>".html_safe
    if historiques_personnages != nil
      i = 0
      historiques_personnages.each do |cc|
        cc.niveau = @values_historiques[cc.id] if @values_historiques.present? && @values_historiques[cc.id].present?
        if cc.historique.has_detail
          out << input_data(cc, "historique", "his", cc.historique.nom, format_name(cc.historique.nom), i, cc.historique.description, "detail")
        else
          out << input_data(cc, "historique", "his", cc.historique.nom, format_name(cc.historique.nom), i, cc.historique.description)
        end
        i = i + 1
      end
    end
    out << "</div>".html_safe
    out
  end

  def input_info_general(f, personnage)
    out = "<div class=\"col-md-4\">".html_safe
      out << "<div>#{nom_complet(personnage)}</div>".html_safe
      out << "<br />".html_safe
      out << f.input(:date_naissance, as: :string, label: 'Date de naissance :', placeholder: 'dd/mm/yyyy', input_html: {value: local_date(personnage.date_naissance), class: 'datepicker inpt_string'}, wrapper_html: { class: 'inline' })
    out << "</div>".html_safe
    out << "<div class=\"col-md-4\">".html_safe
      out << f.input(:nature, label: 'Nature :', collection: Personnage::ARCHETYPE, wrapper_html:{ class: 'inline'})
      out << "<br />".html_safe
      out << f.input(:attitude, label: 'Attitude :', collection: Personnage::ARCHETYPE, wrapper_html:{ class: 'inline'})
    out << "</div>".html_safe
    out << "<div class=\"col-md-4\">".html_safe
      out << "<div><b>#{personnage.type_perso}</b></div>".html_safe
      out << "<br />".html_safe
      out << "<div><b>#{personnage.appartenance_perso}</b></div>".html_safe
      out << input_type_changelin(f, personnage)
    out << "</div>".html_safe
    out
  end

  def input_xps_et_bonus(f)
    out = f.input(:bonus)
    out << f.input(:xps)
    out << f.input(:reste_xps)
    out
  end
end
