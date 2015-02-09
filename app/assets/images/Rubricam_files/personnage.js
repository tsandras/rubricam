  function listenerAllAttributs() {
    liste_attributs = ["personnage_force", "personnage_dexterite", "personnage_vigueur",
                        "personnage_charisme", "personnage_manipulation", "personnage_apparence",
                        "personnage_perception", "personnage_intelligence", "personnage_astuce"];
    $.each(liste_attributs, function(key, val) {
      tmp = val.split("_");
      listenerNumber(tmp[1], "#"+val, 1, 10);
    });
  }

  function listenerAllCapacites() {
    $.each($(".cap"), function(key, val) {
      if ($(this).attr("id")) {
        var tmp = $(this).attr("id").split("_");
        listenerNumber(tmp[1], "#" + $(this).attr("id") + " #capacites_personnages_niveau", 0, 10);
      }
    });
  }

  function listenerAllSpheres() {
    $.each($(".sph"), function(key, val) {
      if ($(this).attr("id")) {
        console.log($(this).attr("id"));
        // var tmp = $(this).attr("id").split("_");
        listenerNumber($(this).attr("id"), "#" + $(this).attr("id") + " #spheres_personnages_niveau", 0, 5);
      }
    });
  }

  function listenerCapacite(idCapacite) {
    // console.log("test", idCapacite, $(idCapacite).attr("id"));
    var tmp = idCapacite.split("_");
    listenerNumber(tmp[1], idCapacite + " #capacites_personnages_niveau", 0, 10);
  }

  function listenerNumber(name, idInput, min, max) {
    listenerUp("#plus-"+name, idInput, max);
    listenerDown("#minus-"+name, idInput, min);
  }

  function listenerUp(idButton, idInput, max) {
    // console.log("On entre ici !", idButton, idInput);
    $(idButton).click(function() {
      if (parseInt($(idInput).val()) < max) {
        // console.log("Coucou ?");
        manageShowSpecialite(parseInt($(idInput).val()) + 1, idButton);
        $(idInput).val(parseInt($(idInput).val()) + 1);
        manageCalculeXps($("#personnage_type_perso").val());
      }
    });
  }

  function listenerDown(idButton, idInput, min) {
    $(idButton).click(function() {
      if (parseInt($(idInput).val()) > min) {
        manageShowSpecialite(parseInt($(idInput).val()) - 1, idButton);
        $(idInput).val(parseInt($(idInput).val()) - 1);
        manageCalculeXps($("#personnage_type_perso").val());
      }
    });
  }

  function manageShowSpecialite(value, idInput) {
    var tmp = idInput.split("-");
    // console.log(idInput+" "+tmp[1]);
    if (value == 4) {
      $("#specialite-"+tmp[1]).removeClass("hidden");
      $("#description-"+tmp[1]).addClass("hidden");
    } else if (value == 3) {
      $("#description-"+tmp[1]).removeClass("hidden");
      $("#specialite-"+tmp[1]).addClass("hidden");
    }
  }

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
        $("."+tmp[1].trim() +" "+ NameClassOfInput).last().parent().append(getHTMLInputCapacite($(this).parent().text(), this.value));
        // console.log("On écoute le nouveau !" + tmp[0].trim());
        listenerCapacite("#t_"+tmp[0].trim());
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
  $(listToListening).change(function() {
    // console.log($(".dis").length);
    var tmp = $(this).parent().text();
    if(this.checked) {
      if (! $("#f_"+tmp).length) {
        console.log($(".dis").length);
        var nbs = $(".dis").length;
        // En fonction du nombre de discipline que possède le personnage, faire poper la discipline sur la bonne colone
        if (nbs == 0 || nbs == 3 || nbs == 6 || nbs == 9 || nbs == 12 || nbs == 15) {
          $(".col-dis-0").append(getHTMLInputDiscipline($(this).parent().text(), this.value));
        } else if (nbs == 1 || nbs == 4 || nbs == 7 || nbs == 10 || nbs == 13 || nbs == 16) {
          $(".col-dis-1").append(getHTMLInputDiscipline($(this).parent().text(), this.value));
        } else {
          $(".col-dis-2").append(getHTMLInputDiscipline($(this).parent().text(), this.value));
        }
      }
    } else {
      $("#t_"+tmp).remove();
    }
  });
}

function getHTMLInputCapacite(name, id) {
  tmp = name.split("-");
  out = "<div class=\"row cap\" id=\"t_"+tmp[0].trim()+"\">";
  out += "<div class=\"col-md-4\">";
  out += "<b>"+tmp[0].trim()+"</b>";
  out += "</div>";
  out += "<button type=\"button\" class=\"moins_cap\" id=\"minus-"+tmp[0].trim()+"\" name=\"button\"></button>";
  out += "<button type=\"button\" class=\"plus_cap\" id=\"plus-"+tmp[0].trim()+"\" name=\"button\"></button>";
  out += "<div class=\"control-group integer optional capacites_personnages_niveau col-md-2\">";
  out += "<label class=\"integer optional control-label\" for=\"capacites_personnages_niveau\"> </label>"
  out += "<div class=\"controls\"><input class=\"numeric integer optional inpt_number\" id=\"capacites_personnages_niveau\" name=\"capacites_personnages["+id+"][niveau]\" step=\"1\" type=\"number\" value=\"0\" readonly=\"true\"/></div></div>";
  out += "<div class=\"control-group string optional capacites_personnage s_specialite col-md-6 hidden\" id=\"specialite-"+tmp[0].trim()+"\">";
  out += "<label class=\"string optional control-label\" for=\"capacites_personnages_specialite\">Specialite</label>";
  out += "<div class=\"controls\"><input class=\"string optional inpt_string\" id=\"capacites_personnages_specialite\" name=\"capacites_personnages["+id+"][specialite]\" size=\"50\" type=\"text\" value=\"\" /></div></div>";
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
  out = "<div class=\"dis\" id=\"t_"+name+"\">";
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

function fusionBaseBonus(base, bonus) {
  var out = {};
  out.Personnage = {};
  out.Capacites = {};
  out.Historiques = {};
  out.Spheres = {};
  out.Capacites.Talent = {};
  out.Capacites.Competence = {};
  out.Capacites.Connaissance = {};
  out.Personnage["force"] = base.Personnage["force"] + bonus.Personnage["force"];
  out.Personnage["dexterite"] = base.Personnage["dexterite"] + bonus.Personnage["dexterite"];
  out.Personnage["vigueur"] = base.Personnage["vigueur"] + bonus.Personnage["vigueur"];
  out.Personnage["charisme"] = base.Personnage["charisme"] + bonus.Personnage["charisme"];
  out.Personnage["manipulation"] = base.Personnage["manipulation"] + bonus.Personnage["manipulation"];
  out.Personnage["apparence"] = base.Personnage["apparence"] + bonus.Personnage["apparence"];
  out.Personnage["perception"] = base.Personnage["perception"] + bonus.Personnage["perception"];
  out.Personnage["intelligence"] = base.Personnage["intelligence"] + bonus.Personnage["intelligence"];
  out.Personnage["astuce"] = base.Personnage["astuce"] + bonus.Personnage["astuce"];
  $.each(base.Capacites.Talent, function(key, val) {
    out.Capacites.Talent[key] = val + bonus.Capacites.Talent[key];
  });
  $.each(base.Capacites.Competence, function(key, val) {
    out.Capacites.Competence[key] = val + bonus.Capacites.Competence[key];
  });
  $.each(base.Capacites.Connaissance, function(key, val) {
    out.Capacites.Connaissance[key] = val + bonus.Capacites.Connaissance[key];
  });
  $.each(base.Historiques, function(key, val) {
    out.Historiques[key] = val + bonus.Historiques[key];
  });
  if (base.Sphere) {
    $.each(base.Spheres, function(key, val) {
      out.Spheres[key] = val + bonus.Spheres[key];
    });
  }
  out = $.extend({}, bonus, out); // for new stuff in bonus
  return out;
}
;
