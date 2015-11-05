module NodesHelper
def input_resonnance_for_nodes(f, node)
    out = "<div class=\"row resonnance\">".html_safe
    out << "<div class='col-md-4'><b>Dynamique</b></div>".html_safe
    out << "<div class=\"col-md-2\">".html_safe
      out << button_tag('', type: 'button', id: "minus-dynamique", class: 'moins_new')
      out << button_tag('', type: 'button', id: "plus-dynamique", class: 'plus_new')
    out << "</div>".html_safe
    out << f.input(:dynamique, label: false, input_html: {class: 'inpt_number', readonly: 'true', value: node.dynamique ? node.dynamique : 0}, wrapper_html: { class: 'col-md-1' })
    out << f.input(:spec_dynamique, label: false, input_html: { class: 'spe' }, wrapper_html: { class: 'col-md-5' })
    out << "</div>".html_safe

    out <<"<div class=\"row resonnance\">".html_safe
    out << "<div class='col-md-4'><b>Statique</b></div>".html_safe
    out << "<div class=\"col-md-2\">".html_safe
      out << button_tag('', type: 'button', id: "minus-statique", class: 'moins_new')
      out << button_tag('', type: 'button', id: "plus-statique", class: 'plus_new')
    out << "</div>".html_safe
    out << f.input(:statique, label: false, input_html: {class: 'inpt_number', readonly: 'true', value: node.statique ? node.statique : 0}, wrapper_html: { class: 'col-md-1' })
    out << f.input(:spec_statique, label: false, input_html: { class: 'spe' }, wrapper_html: { class: 'col-md-5' })
    out << "</div>".html_safe

    out <<"<div class=\"row resonnance\">".html_safe
    out << "<div class='col-md-4'><b>Entropique</b></div>".html_safe
    out << "<div class=\"col-md-2\">".html_safe
      out << button_tag('', type: 'button', id: "minus-entropique", class: 'moins_new')
      out << button_tag('', type: 'button', id: "plus-entropique", class: 'plus_new')
    out << "</div>".html_safe
    out << f.input(:entropique, label: false, input_html: {class: 'inpt_number', readonly: 'true', value: node.entropique ? node.entropique : 0}, wrapper_html: { class: 'col-md-1' })
    out << f.input(:spec_entropique, label: false, input_html: { class: 'spe' }, wrapper_html: { class: 'col-md-5' })
    out << "</div>".html_safe
    out
  end

  def input_niveau(f, node)
    out = "<div class=\"row niveau\">".html_safe
    out << "<div class='col-md-4'><b>Niveau</b></div>".html_safe
    out << "<div class=\"col-md-2\">".html_safe
      out << button_tag('', type: 'button', id: "minus-niveau", class: 'moins_new')
      out << button_tag('', type: 'button', id: "plus-niveau", class: 'plus_new')
    out << "</div>".html_safe
    out << f.input(:niveau, label: false, input_html: {class: 'inpt_number', readonly: 'true', value: node.niveau ? node.niveau : 0}, wrapper_html: {class: 'col-md-1'})
    out << "<div class=\"col-md-5\"></div>".html_safe
    out << "</div>".html_safe
    out
  end
end
