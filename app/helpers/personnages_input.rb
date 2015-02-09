module PersonnagesInput

  def input_points_sang(f, perso)
    if perso.vampire? || perso.type_perso == nil
      f.input :points_sang
    end
  end

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

  def input_kinain(f, personnage)
    if personnage.type_perso =~ /Kinain/i
      f.input(:glamour) <<
      f.input(:banalite)
    end
  end

  def input_voie(f, personnage)
    if personnage.vampire?
      out = "<div class=\"row voie\">".html_safe
      out << "<div class='col-md-2'><b>Voie</b></div>".html_safe
      out << f.input(:voie, label: "&nbsp;".html_safe, collection: Personnage::VOIE, wrapper_html: { class: 'col-md-8' })
      out << "<div class=\"col-md-2\" id=\"niveau-voie\">#{personnage.points_conscience+personnage.points_maitrise}</div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_entelechie(f, personnage)
    if personnage.mage? || personnage.type_perso == nil
      out = "<div class=\"row entelechie\">".html_safe
      out << "<div class='col-md-4'><b>Entéléchie</b></div>".html_safe
      out << f.input(:entelechie, label: "&nbsp;".html_safe, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: {class: 'col-md-2'})
      out << button_tag('', type: 'button', id: "minus-entelechie", class: 'moins_cap')
      out << button_tag('', type: 'button', id: "plus-entelechie", class: 'plus_cap')
      out << "<div class=\"col-md-6\"></div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_vertue(f, personnage)
    if personnage.vampire? || personnage.has_vertues
      out = "<div class=\"row vertue\">".html_safe
      out << "<div class='col-md-4'><b>Conscience</b></div>".html_safe
      out << f.input(:points_conscience, label: "&nbsp;".html_safe, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: { class: 'col-md-2' })
      out << button_tag('', type: 'button', id: "minus-conscience", class: 'moins_cap')
      out << button_tag('', type: 'button', id: "plus-conscience", class: 'plus_cap')
      out << "<div class=\"col-md-6\"></div>".html_safe
      out << "</div>".html_safe

      out <<"<div class=\"row vertue\">".html_safe
      out << "<div class='col-md-4'><b>Maîtrise de soi</b></div>".html_safe
      out << f.input(:points_maitrise, label: "&nbsp;".html_safe, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: { class: 'col-md-2' })
      out << button_tag('', type: 'button', id: "minus-maitrise", class: 'moins_cap')
      out << button_tag('', type: 'button', id: "plus-maitrise", class: 'plus_cap')
      out << "<div class=\"col-md-6\"></div>".html_safe
      out << "</div>".html_safe

      out <<"<div class=\"row vertue\">".html_safe
      out << "<div class='col-md-4'><b>Courage</b></div>".html_safe
      out << f.input(:points_courage, label: "&nbsp;".html_safe, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: { class: 'col-md-2' })
      out << button_tag('', type: 'button', id: "minus-courage", class: 'moins_cap')
      out << button_tag('', type: 'button', id: "plus-courage", class: 'plus_cap')
      out << "<div class=\"col-md-6\"></div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_resonnance(f, personnage)
    if personnage.mage? || personnage.has_resonnances
      out = "<div class=\"row resonnance\">".html_safe
      out << "<div class='col-md-4'><b>Dymanique</b></div>".html_safe
      out << f.input(:points_dynamique, label: "&nbsp;".html_safe, input_html: {class: 'inpt_number', readonly: 'true', value: personnage.points_dynamique ? personnage.points_dynamique : 0}, wrapper_html: { class: 'col-md-2' })
      out << button_tag('', type: 'button', id: "minus-dynamique", class: 'moins_cap')
      out << button_tag('', type: 'button', id: "plus-dynamique", class: 'plus_cap')
      out << "<div class=\"col-md-6\"></div>".html_safe
      out << "</div>".html_safe

      out <<"<div class=\"row resonnance\">".html_safe
      out << "<div class='col-md-4'><b>Statique</b></div>".html_safe
      out << f.input(:points_statique, label: "&nbsp;".html_safe, input_html: {class: 'inpt_number', readonly: 'true', value: personnage.points_dynamique ? personnage.points_dynamique : 0}, wrapper_html: { class: 'col-md-2' })
      out << button_tag('', type: 'button', id: "minus-statique", class: 'moins_cap')
      out << button_tag('', type: 'button', id: "plus-statique", class: 'plus_cap')
      out << "<div class=\"col-md-6\"></div>".html_safe
      out << "</div>".html_safe

      out <<"<div class=\"row resonnance\">".html_safe
      out << "<div class='col-md-4'><b>Entropique</b></div>".html_safe
      out << f.input(:points_entropique, label: "&nbsp;".html_safe, input_html: {class: 'inpt_number', readonly: 'true', value: personnage.points_dynamique ? personnage.points_dynamique : 0}, wrapper_html: { class: 'col-md-2' })
      out << button_tag('', type: 'button', id: "minus-entropique", class: 'moins_cap')
      out << button_tag('', type: 'button', id: "plus-entropique", class: 'plus_cap')
      out << "<div class=\"col-md-6\"></div>".html_safe
      out << "</div>".html_safe
      out
    end
  end

  def input_volonte(f)
    out = "<div class=\"row volonte\">".html_safe
    out << "<div class='col-md-4'><b>Volonté</b></div>".html_safe
    out << f.input(:volonte, label: "&nbsp;".html_safe, input_html: {class: 'inpt_number', readonly: 'true'}, wrapper_html: {class: 'col-md-2'})
    out << button_tag('', type: 'button', id: "minus-volonte", class: 'moins_cap')
    out << button_tag('', type: 'button', id: "plus-volonte", class: 'plus_cap')
    out << "<div class=\"col-md-6\"></div>".html_safe
    out << "</div>".html_safe
    out
  end

  def input_attribut(f, personnage, name, affichage)
    out = "<div class=\"row attribut\">".html_safe
    if personnage.send("#{name}").present?
      out << f.input("#{name}", label: "#{affichage}", input_html: { class: 'inpt_number', readonly: 'true' }, wrapper_html: { class: 'col-md-4' })
    else
      out << f.input("#{name}", label: "#{affichage}", input_html: { class: 'inpt_number', value: 1, readonly: 'true' }, wrapper_html: { class: 'col-md-4' })
    end
    out << button_tag('', type: 'button', id: "minus-#{name}", class: 'moins')
    out << button_tag('', type: 'button', id: "plus-#{name}", class: 'plus')
    out << "<div class=\"col-md-8\">".html_safe
    if personnage.send("#{name}").blank? || personnage.send("#{name}") < 4
      out << "<div class=\"description-attribut\" id=\"description-#{name}\"> #{Personnage::ATTRIBUT_DESC["#{name}"]} </div>".html_safe
      out << f.input("spec_#{name}", label: "Spécialité", input_html: { class: 'inpt_string' }, wrapper_html: { class: 'hidden', id: "specialite-#{name}" })
    else
      out << "<div class=\"description-attribut hidden\" id=\"description-#{name}\"> #{Personnage::ATTRIBUT_DESC["#{name}"]} </div>".html_safe
      out << f.input("spec_#{name}", label: "Spécialité", input_html: { class: 'inpt_string' }, wrapper_html: { id: "specialite-#{name}" })
    end
    out << "</div>".html_safe
    out << "</div>".html_safe
    out
  end

  def input_attributs(f, personnage)
    out = "<div class=\"col-xs-4\">".html_safe
      out << "<p class=\"text-center\"><b>Physique</b>#{show_nbs_physique(personnage)}</p>".html_safe
      out << input_attribut(f, personnage, "force", "Force")
      out << input_attribut(f, personnage, "dexterite", "Dextérité")
      out << input_attribut(f, personnage, "vigueur", "Vigueur")
      out << "</div>".html_safe
    out << "<div class=\"col-xs-4\">".html_safe
      out << "<p class=\"text-center\"><b>Social</b>#{show_nbs_social(personnage)}</p>".html_safe
      out << input_attribut(f, personnage, "charisme", "Charisme")
      out << input_attribut(f, personnage, "manipulation", "Manipulation")
      out << input_attribut(f, personnage, "apparence", "Apparence")
    out << "</div>".html_safe
    out << "<div class=\"col-xs-4\">".html_safe
      out << "<p class=\"text-center\"><b>Mental</b>#{show_nbs_mental(personnage)}</p>".html_safe
      out << input_attribut(f, personnage, "perception", "Perception")
      out << input_attribut(f, personnage, "intelligence", "Intelligence")
      out << input_attribut(f, personnage, "astuce", "Astuce")
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

  def input_spheres(personnage)
    out = ""
    tmp = 0
    (0..8).each do |i|
      if tmp % 3 == 0
        out << "<div class=\"col-xs-4\">".html_safe
      end
      tmp = tmp + 1
      nom = Sphere::SPHERE[i]
      if has_sphere(nom, personnage)
        sphere = Sphere.where(name: nom, personnage_id: personnage.id).first
      else
        sphere = Sphere.create(name: nom)
      end
      out << "<div class=\"row sph\" id=\"#{nom}\">".html_safe
      out << button_tag('', type: 'button', id: "minus-#{nom}", class: 'moins_cap')
      out << button_tag('', type: 'button', id: "plus-#{nom}", class: 'plus_cap')
      out << simple_fields_for(sphere) do |s|
        "<div class='col-md-4'><b>#{nom}</b></div>".html_safe <<
        s.input(:niveau, label: "&nbsp;".html_safe, input_html: { id: 'spheres_personnages_niveau', name: "spheres_personnages[#{sphere.id}][niveau]", class: 'inpt_number', readonly: 'true', value: sphere.niveau.present? ? sphere.niveau : 0 }, wrapper_html: { class: 'col-md-2' }) <<
        "<div class=\"col-md-6 reajuste-spe\">".html_safe <<
        if sphere.niveau.blank? || sphere.niveau < 4
          "<div class=\"description-attribut\" id=\"description-#{nom}\"> #{Sphere::SPHERE_DESCRIPTION["#{nom}"]} </div>".html_safe <<
          s.input(:specialite, label: "Specialite", input_html: { id: 'spheres_personnages_specialite', name: "spheres_personnages[#{sphere.id}][specialite]", class: 'inpt_string' }, wrapper_html: { class: 'hidden', id: "specialite-#{sphere.name}" })
        else
          "<div class=\"description-attribut hidden\" id=\"description-#{nom}\"> #{Sphere::SPHERE_DESCRIPTION["#{nom}"]} </div>".html_safe <<
          s.input(:specialite, label: "Specialite", input_html: { id: 'spheres_personnages_specialite', name: "spheres_personnages[#{sphere.id}][specialite]" }, wrapper_html: { id: "specialite-#{sphere.name}" })
        end
      end
      out << "</div>"
      out << "</div>"
      if tmp % 3 == 0
        out << "</div>".html_safe
      end
    end
    out.html_safe
  end

  # To do: FIX bug when there are nom like "Force d'âme"
  def input_discipline(disciplines)
    out_final = "".html_safe
    out_col_un = "<div class=\"col-md-4 col-dis-0\">".html_safe
    out_col_deux = "<div class=\"col-md-4 col-dis-1\">".html_safe
    out_col_trois = "<div class=\"col-md-4 col-dis-2\">".html_safe
    i = 0
    if disciplines != nil
      disciplines.each do |cc|
        forma_name = format_name(cc.discipline.nom)
        out = "<div class=\"row dis\" id=\"f_#{forma_name}\">".html_safe
        out << button_tag('', type: 'button', id: "minus-#{forma_name}", class: 'moins_cap')
        out << button_tag('', type: 'button', id: "plus-#{forma_name}", class: 'plus_cap')
        simple_fields_for(cc) do |c|
          out << "<div class=\"col-md-4\">".html_safe
          out << "<b> #{cc.discipline.nom} </b>".html_safe
          out << "</div>".html_safe
          out << c.input(:niveau, label: "&nbsp;".html_safe, input_html: {name: "disciplines_personnages[#{cc.id}][niveau]", class: 'inpt_number', readonly: 'true' }, wrapper_html: { class: 'col-md-2' })
          out << "<div class=\"col-md-6\"></div>".html_safe
          out << "<span class=\"hidden\" id=\"d_#{cc.id}\">#{cc.discipline.id}</span>".html_safe
        end
        out << "</div>".html_safe
        if i % 3 == 0
          out_col_un << out
        elsif i % 3 == 1
          out_col_deux << out
        else
          out_col_trois << out
        end
        i = i + 1
      end
    end
    out_final << out_col_un << "</div>".html_safe << out_col_deux << "</div>".html_safe << out_col_trois << "</div>".html_safe
    out_final
  end

  def input_capacite(capacites_personnages, personnage)
    out = "".html_safe
    talent = "<div class=\"col-xs-4 Talent\"><p class=\"text-center\"><b>Talents</b>#{show_nbs_talent(personnage)}</p>".html_safe
    competence = "<div class=\"col-xs-4 Compétence\"><p class=\"text-center\"><b>Compétences</b>#{show_nbs_competences(personnage)}</p>".html_safe
    connaissance = "<div class=\"col-xs-4 Connaissance\"><p class=\"text-center\"><b>Connaissances</b>#{show_nbs_connaissances(personnage)}</p>".html_safe
    if capacites_personnages != nil && capacites_personnages.count > 0
      capacites_personnages.each do |cc|
        simple_fields_for(cc) do |c|
          forma_name = format_name(cc.capacite.nom)
          tmp_out = "<div class=\"row cap\" id=\"f_#{forma_name}\">".html_safe
          tmp_out << "<div class=\"col-md-4\">".html_safe
          tmp_out << "<b> #{cc.capacite.nom} </b>".html_safe
          tmp_out << "</div>".html_safe
          tmp_out << button_tag('', type: 'button', id: "minus-#{forma_name}", class: 'moins_cap')
          tmp_out << button_tag('', type: 'button', id: "plus-#{forma_name}", class: 'plus_cap')
          tmp_out << c.input(:niveau, label: "&nbsp;".html_safe, input_html: {name: "capacites_personnages[#{cc.id}][niveau]", class: 'inpt_number', readonly: 'true' }, wrapper_html: { class: 'col-md-2' })
          if cc.niveau.blank? || cc.niveau < 4
            tmp_out << c.input(:specialite, input_html: {class: 'inpt_string', name: "capacites_personnages[#{cc.id}][specialite]"}, wrapper_html: { class: 'col-md-6 hidden reajuste-spe', id: "specialite-#{forma_name}" })
          else
            tmp_out << c.input(:specialite, input_html: {class: 'inpt_string', name: "capacites_personnages[#{cc.id}][specialite]"}, wrapper_html: { class: 'col-md-6 reajuste-spe', id: "specialite-#{forma_name}" })
          end
          tmp_out << "<span class=\"hidden\" id=\"#{cc.id}\"> #{cc.capacite.id}:#{cc.capacite.type_cap}</span>".html_safe
          tmp_out << "</div>".html_safe
          if cc.capacite.type_cap == "Talent"
            talent << tmp_out
          elsif cc.capacite.type_cap == "Compétence"
           competence << tmp_out
          else
            connaissance << tmp_out
          end
        end
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
    out << "<p class=\"text-center his\"><b>Historiques</b>#{show_nbs_historiques(personnage)}</p>".html_safe
    if historiques_personnages != nil
      historiques_personnages.each do |cc|
        out << "<div class=\"row his\" id=\"f_#{cc.historique.nom}\">".html_safe
         simple_fields_for(cc) do |c|
          out << "<div class=\"col-md-4\">".html_safe
          out << "<b>#{cc.historique.nom}</b>".html_safe
          out << "</div>".html_safe
          out << button_tag('', type: 'button', id: "minus-#{cc.historique.nom}", class: 'moins_cap')
          out << button_tag('', type: 'button', id: "plus-#{cc.historique.nom}", class: 'plus_cap')
          out << c.input(:niveau, label: "&nbsp;".html_safe, input_html: {name: "historiques_personnages[#{cc.id}][niveau]", class: 'inpt_number', readonly: 'true'}, wrapper_html: { class: 'col-md-2' })
          if cc.historique.has_detail
            out << c.input(:detail, label: "&nbsp;".html_safe, input_html: {name: "historiques_personnages[#{cc.id}][detail]", class: 'inpt_string'}, wrapper_html: { class: 'col-md-6' })
          else
            out << "<div class=\"col-md-6\">".html_safe
            out << "</div>".html_safe
          end
          out << "<span class=\"hidden\" id=\"h_#{cc.id}\">#{cc.historique.id}</span>".html_safe
          out << "</div>".html_safe
        end
      end
    end
    out << "</div>".html_safe
    out
  end

  def input_atout(atouts_personnages)
    out = "<p class=\"text-center ato\"><b>Atouts</b></p>".html_safe
    if atouts_personnages != nil
      atouts_personnages.each do |cc|
        out << "<div class=\"row ato\" id=\"f_#{cc.atout.nom}\">".html_safe
         simple_fields_for(cc) do |c|
          out << "<div class=\"col-md-4\">".html_safe
          out << "<b>#{cc.atout.nom}</b>".html_safe
          out << "</div>".html_safe
          out << "<div class=\"col-md-2\">".html_safe
          out << "<b>#{cc.atout.cout}</b>".html_safe
          out << "</div>".html_safe
          if cc.atout.has_detail
            out << c.input(:detail, label: "&nbsp;".html_safe, input_html: {name: "atouts_personnages[#{cc.id}][detail]", class: 'inpt_string'}, wrapper_html: { class: 'col-md-6' })
          else
            out << "<div class=\"col-md-6\">".html_safe
            out << "</div>".html_safe
          end
          out << "<span class=\"hidden\" id=\"#{cc.id}\">#{cc.atout.id}</span>".html_safe
          out << "</div>".html_safe
        end
      end
    end
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
      out << "<div><b>#{personnage.clan if personnage.vampire?}</b></div>".html_safe
      out << "<b>#{personnage.tradition if personnage.mage?}</b>".html_safe
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
