function manageCheckBox(searchBox, filteringList) {
    hideAllCheckBoxWhenNoneChecked(filteringList);
    $(filteringList).click(function() {
      $(searchBox).val('');
      showAllCheckBox(filteringList);
      hideAllCheckBoxWhenNoneChecked(filteringList);
    });
}

function epurationCheckBox(element, filteringList) {
  if ($(element).val() == '') {
    showAllCheckBox(filteringList);
    hideAllCheckBoxWhenNoneChecked(filteringList);
  }
}

function filter(element, filteringList) {
  var value = $(element).val().toUpperCase();
  showAllCheckBox(filteringList);
  $(filteringList).each(function() {
      if ($(this).parent().text().toUpperCase().search(value) > -1) {
          $(this).parent().show();
      }
      else {
          $(this).parent().hide();
      }
  });
}

function showAllCheckBox(filteringList) {
  $(filteringList).each(function() {
    $(this).parent().show();
  });
}

function hideAllCheckBoxWhenNoneChecked(filteringList) {
  $(filteringList).each(function() {
    if (!$(this).attr("checked")) {
      $(this).parent().hide();
    }
  });
}

function manageCapacites(listToListening, NameClassOfInput) {
  $(listToListening).change(function() {
    var tmp = $(this).parent().text().split("-");
    if(this.checked) {
      if (! $("#f_"+tmp[0].trim()).length) {
        $(NameClassOfInput).last().parent().append(getHTMLInputCapacite($(this).parent().text(), this.value));
      }
    } else {
      $("#t_"+tmp[0].trim()).remove();
    }
  });
}

function manageHistoriques(listToListening, NameClassOfInput) {
  $(listToListening).change(function() {
    var tmp = $(this).parent().text();
    if(this.checked) {
      if (! $("#f_"+tmp).length) {
        $(NameClassOfInput).last().parent().append(getHTMLInputHistorique($(this).parent().text(), this.value));
      }
    } else {
      $("#t_"+tmp).remove();
    }
  });
}

function manageDisciplines(listToListening, NameClassOfInput) {
  console.log("test");
  $(listToListening).change(function() {
    console.log("coucou");
    var tmp = $(this).parent().text();
    if(this.checked) {
      if (! $("#f_"+tmp).length) {
        $(NameClassOfInput).last().parent().append(getHTMLInputDiscipline($(this).parent().text(), this.value));
      }
    } else {
      $("#t_"+tmp).remove();
    }
  });
}

function getHTMLInputCapacite(name, id) {
  tmp = name.split("-");
  out = "<div class=\"cap\" id=\"t_"+tmp[0].trim()+"\">";
  out += "<div class=\"col-md-4\">";
  out += "<b>"+name+"</b><i></i>";
  out += "</div>";
  out += "<div class=\"control-group integer optional capacites_personnages_niveau col-md-2\">";
  out += "<label class=\"integer optional control-label\" for=\"capacites_personnages_niveau\">Niveau</label>"
  out += "<div class=\"controls\"><input class=\"numeric integer optional\" id=\"capacites_personnages_niveau\" name=\"capacites_personnages["+id+"][niveau]\" step=\"1\" type=\"number\" value=\"\" /></div></div>";
  out += "<div class=\"control-group string optional capacites_personnages_specialite col-md-6\">";
  out += "<label class=\"string optional control-label\" for=\"capacites_personnages_specialite\">Specialite</label>";
  out += "<div class=\"controls\"><input class=\"string optional\" id=\"capacites_personnages_specialite\" name=\"capacites_personnages["+id+"][specialite]\" size=\"50\" type=\"text\" value=\"\" /></div></div>";
  out += "<span class=\"hidden\" id=\""+id+"\">"+id+":"+tmp[1].trim()+"</span>";
  out += "</div>"
  return out;
}

function getHTMLInputHistorique(name, id) {
  out = "<div class=\"his\" id=\"t_"+name+"\">";
  out += "<div class=\"col-md-6\">";
  out += "<b>"+name+"</b>"
  out += "</div>"
  out += "<div class=\"control-group integer optional historiques_personnages_niveau col-md-6\">";
  out += "<label class=\"integer optional control-label\" for=\"historiques_personnages_niveau\">Niveau</label>";
  out += "<div class=\"controls\">";
  out += "<input class=\"numeric integer optional\" id=\"historiques_personnages_niveau\" name=\"historiques_personnages["+id+"][niveau]\" step=\"1\" type=\"number\" value=\"\" /></div>";
  out += "<span class=\"hidden\" id=\""+id+"\">"+id+"</span>";
  out += "</div>"
  return out;
}

function getHTMLInputDiscipline(name, id) {
  out = "<div class=\"his\" id=\"t_"+name+"\">";
  out += "<div class=\"col-md-6\">";
  out += "<b>"+name+"</b>"
  out += "</div>"
  out += "<div class=\"control-group integer optional disciplines_personnages_niveau col-md-6\">";
  out += "<label class=\"integer optional control-label\" for=\"disciplines_personnages_niveau\">Niveau</label>";
  out += "<div class=\"controls\">";
  out += "<input class=\"numeric integer optional\" id=\"disciplines_personnages_niveau\" name=\"disciplines_personnages["+id+"][niveau]\" step=\"1\" type=\"number\" value=\"\" /></div>";
  out += "<span class=\"hidden\" id=\""+id+"\">"+id+"</span>";
  out += "</div>"
  return out;
}
