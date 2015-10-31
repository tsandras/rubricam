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
        listenerNumber($(this).attr("id"), "#" + $(this).attr("id") + " #spheres_personnages_niveau", 0, 6);
      }
    });
  }

  function listenerAllDisciplines() {
    $.each($(".dis"), function(key, val) {
      if ($(this).attr("id")) {
        var tmp = $(this).attr("id").split("_");
        name = tmp[1].split(" ").join("").split("'").join("")
        listenerNumber(name, "#" + $(this).attr("id") + " #disciplines_personnages_niveau", 0, 10);
      }
    });
  }

  function listenerAllHistoriques() {
    $.each($(".his"), function(key, val) {
      if ($(this).attr("id")) {
        var tmp = $(this).attr("id").split("_");
        listenerNumber(tmp[1], "#" + $(this).attr("id") + " #historiques_personnages_niveau", 0, 10);
      }
    });
  }

  function listenerAllArts() {
    $.each($(".art"), function(key, val) {
      if ($(this).attr("id")) {
        var tmp = $(this).attr("id").split("_");
        listenerNumber(tmp[1], "#" + $(this).attr("id") + " #arts_personnages_niveau", 0, 6);
      }
    });
  }

  function listenerAllRoyaumes() {
    $.each($(".roy"), function(key, val) {
      if ($(this).attr("id")) {
        var tmp = $(this).attr("id").split("_");
        listenerNumber(tmp[1], "#" + $(this).attr("id") + " #personnages_royaumes_niveau", 0, 5);
      }
    });
  }

  function listenerCapacite(idCapacite) {
    var tmp = idCapacite.split("_");
    listenerNumber(tmp[1], idCapacite + " #capacites_personnages_niveau", 0, 10);
  }

  function listenerDiscipline(idDiscipline) {
    var tmp = idDiscipline.split("_");
    listenerNumber(tmp[1], idDiscipline + " #disciplines_personnages_niveau", 0, 10);
  }

  function listenerArt(idArt) {
    var tmp = idArt.split("_");
    listenerNumber(tmp[1], idArt + " #arts_personnages_niveau", 0, 6);
  }

  function listenerHistorique(idHistorique) {
    var tmp = idHistorique.split("_");
    listenerNumber(format_name(tmp[1]), format_name(idHistorique) + " #historiques_personnages_niveau", 0, 10);
  }

  function listenerVertues() {
    var idConscience = "#personnage_points_conscience";
    var idMaitrise = "#personnage_points_maitrise";
    var idCourage = "#personnage_points_courage";
    var tmp = idConscience.split("_");
    listenerNumber(tmp[2], idConscience, 1, 5);

    var tmp = idMaitrise.split("_");
    listenerNumber(tmp[2], idMaitrise, 1, 5);

    var tmp = idCourage.split("_");
    listenerNumber(tmp[2], idCourage, 1, 5);
  }

  function listenerResonnances() {
    var idDynamique = "#personnage_points_dynamique";
    var idStatique = "#personnage_points_statique";
    var idEntropique = "#personnage_points_entropique";

    var tmp = idDynamique.split("_");
    listenerNumber(tmp[2], idDynamique, 0, 10);

    var tmp = idStatique.split("_");
    listenerNumber(tmp[2], idStatique, 0, 10);

    var tmp = idEntropique.split("_");
    listenerNumber(tmp[2], idEntropique, 0, 10);
  }

  function listenerEntelechie(idEntelechie) {
    var tmp = idEntelechie.split("_");
    listenerNumber(tmp[1], idEntelechie, 1, 10);
  }

  function listenerVolonte(idVolonte) {
    var tmp = idVolonte.split("_");
    listenerNumber(tmp[1], idVolonte, 1, 10);
  }

  function listenerGlamour(idGlamour) {
    var tmp = idGlamour.split("_");
    listenerNumber(tmp[1], idGlamour, 0, 10);
  }

  function listenerBanalite(idBanalite) {
    var tmp = idBanalite.split("_");
    listenerNumber(tmp[1], idBanalite, 0, 10);
  }

  function listenerSang(idSang) {
    var tmp = idSang.split("_");
    listenerNumber(tmp[1]+"_"+tmp[2], idSang, 0, 100);
  }

  function listenerPhysiqueForBase(min, max) {
    liste_attributs = ["#personnage_force", "#personnage_dexterite", "#personnage_vigueur"];
    var sum = sumValuesOfList($("#personnage_force, #personnage_dexterite, #personnage_vigueur"))
    $("#nbs_physique").html(" "+ (sum-3));
    $.each(liste_attributs, function(key, val) {
      tmp = val.split("_");
      $("#plus-"+tmp[1]).click(function() {
        var sum = sumValuesOfList($("#personnage_force, #personnage_dexterite, #personnage_vigueur"))
        $("#nbs_physique").html(" "+ (sum-3));
      });
      $("#minus-"+tmp[1]).click(function() {
        var sum = sumValuesOfList($("#personnage_force, #personnage_dexterite, #personnage_vigueur"))
        $("#nbs_physique").html(" "+ (sum-3));
      });
    });
  }

  function listenerMentalForBase(min, max) {
    liste_attributs = ["#personnage_intelligence", "#personnage_perception", "#personnage_astuce"];
    var sum = sumValuesOfList($("#personnage_intelligence, #personnage_perception, #personnage_astuce"))
    $("#nbs_mental").html(" "+ (sum-3));
    $.each(liste_attributs, function(key, val) {
      tmp = val.split("_");
      $("#plus-"+tmp[1]).click(function() {
        var sum = sumValuesOfList($("#personnage_intelligence, #personnage_perception, #personnage_astuce"))
        $("#nbs_mental").html(" "+ (sum-3));
      });
      $("#minus-"+tmp[1]).click(function() {
        var sum = sumValuesOfList($("#personnage_intelligence, #personnage_perception, #personnage_astuce"))
        $("#nbs_mental").html(" "+ (sum-3));
      });
    });
  }

  function listenerSocialForBase(min, max) {
    liste_attributs = ["#personnage_apparence", "#personnage_manipulation", "#personnage_charisme"];
    var sum = sumValuesOfList($("#personnage_apparence, #personnage_manipulation, #personnage_charisme"))
    $("#nbs_social").html(" "+ (sum-3));
    $.each(liste_attributs, function(key, val) {
      tmp = val.split("_");
      $("#plus-"+tmp[1]).click(function() {
        var sum = sumValuesOfList($("#personnage_apparence, #personnage_manipulation, #personnage_charisme"))
        $("#nbs_social").html(" "+ (sum-3));
      });
      $("#minus-"+tmp[1]).click(function() {
        var sum = sumValuesOfList($("#personnage_apparence, #personnage_manipulation, #personnage_charisme"))
        $("#nbs_social").html(" "+ (sum-3));
      });
    });
  }

  // ClassType = Talent, idOutput = #nbs_talent
  function listenerTypeCapacitesForBase(ClassType, idOutput, min, max) {
    var sum = sumValuesOfList($("."+ClassType).find("input[name*='capacites_personnages'].integer"))
    $(idOutput).html(" "+sum);
    $.each($(".cap"), function(key, val) {
      if ($(this).parent().hasClass(ClassType)) {
        var tmp = $(this).attr("id").split("_");
        $("#plus-"+tmp[1]).click(function() {
          var sum = sumValuesOfList($("."+ClassType).find("input[name*='capacites_personnages'].integer"))
          $(idOutput).html(" "+sum);
        });
        $("#minus-"+tmp[1]).click(function() {
          var sum = sumValuesOfList($("."+ClassType).find("input[name*='capacites_personnages'].integer"))
          $(idOutput).html(" "+sum);
        });
      }
    });
  }

  function listenerHistoriquesForBase(min) {
    var max = parseInt($("#max_historiques").html());
    var sum = sumValuesOfList($("input[name*='historiques_personnages'].integer"))
    $("#nbs_historiques").html(" "+ sum);
    $.each($(".his"), function(key, val) {
      if ($(this).attr("id")) {
        var tmp = $(this).attr("id").split("_");
        $("#plus-"+tmp[1]).click(function() {
          var sum = sumValuesOfList($("input[name*='historiques_personnages'].integer"))
          $("#nbs_historiques").html(" " + sum);
        });
        $("#minus-"+tmp[1]).click(function() {
          var sum = sumValuesOfList($("input[name*='historiques_personnages'].integer"))
          $("#nbs_historiques").html(" "+ sum);
        });
      }
    });
  }

  function listenerHistoriqueForBase(idWrapper, min) {
    var max = parseInt($("#max_historiques").html());
    if ($(idWrapper).attr("id")) {
      var tmp = $(idWrapper).attr("id").split("_");
      $("#plus-"+tmp[1]).click(function() {
        var sum = sumValuesOfList($("input[name*='historiques_personnages'].integer"))
        $("#nbs_historiques").html(" "+ sum);
      });
      $("#minus-"+tmp[1]).click(function() {
        var sum = sumValuesOfList($("input[name*='historiques_personnages'].integer"))
        $("#nbs_historiques").html(" "+ sum);
      });
    }
  }

  function listenerSpheresForBase() {
    var max = parseInt($("#max_spheres").html());
    var sum = sumValuesOfList($("input[name*='spheres_personnages'].integer"))
    $("#nbs_spheres").html(" "+ sum);
    $.each($(".sph"), function(key, val) {
      if ($(this).attr("id")) {
        var name = $(this).attr("id");
        $("#plus-"+name).click(function() {
          var sum = sumValuesOfList($("input[name*='spheres_personnages'].integer"))
          $("#nbs_spheres").html(" "+ sum);
        });
        $("#minus-"+name).click(function() {
          var sum = sumValuesOfList($("input[name*='spheres_personnages'].integer"))
          $("#nbs_spheres").html(" "+ sum);
        });
      }
    });
  }

  function sumValuesOfList(list) {
    out = 0
    $(list).each(function(index, el) {
      out += parseInt(el.value)
    })
    return out;
  }

  function listenerVertuesForBase() {
    var liste_vertues = ["#personnage_points_conscience", "#personnage_points_maitrise", "#personnage_points_courage"];
    var max = parseInt($("#max_vertues").html());
    var sum = sumValuesOfList($("#personnage_points_conscience, #personnage_points_maitrise, #personnage_points_courage"))
    $("#nbs_vertues").html(" "+ (sum -3));
    $.each(liste_vertues, function(key, val) {
      var tmp = val.split("_");
      $("#plus-"+tmp[2]).click(function() {
        var sum = sumValuesOfList($("#personnage_points_conscience, #personnage_points_maitrise, #personnage_points_courage"))
        $("#nbs_vertues").html(" "+ (sum -3));
      });
      $("#minus-"+tmp[2]).click(function() {
        var sum = sumValuesOfList($("#personnage_points_conscience, #personnage_points_maitrise, #personnage_points_courage"))
        $("#nbs_vertues").html(" "+ (sum -3));
      });
    });
  }

  function listenerDisciplinesForBase() {
    if ($("#nbs_disciplines").val() != null) {
      var sum = sumValuesOfList($("input[name*='disciplines_personnages'].integer"))
      $("#nbs_disciplines").html(" "+ sum);
      $.each($(".dis"), function(key, val) {
        if ($(this).attr("id")) {
          var tmp = $(this).attr("id").split("_");
          name = tmp[1].split(" ").join("").split("'").join("");
          $("#plus-"+name).click(function() {
            var sum = sumValuesOfList($("input[name*='disciplines_personnages'].integer"))
            $("#nbs_disciplines").html(" "+ sum);
          });
          $("#minus-"+name).click(function() {
            var sum = sumValuesOfList($("input[name*='disciplines_personnages'].integer"))
            $("#nbs_disciplines").html(" "+ sum);
          });
        }
      });
    }
  }

  function manageNiveauVoie(idButton, value) {
    tmp = idButton.split("-");
    if (tmp[1] == "conscience" || tmp[1] == "maitrise") {
      $("#niveau-voie").html(parseInt($("#niveau-voie").html()) + value);
    }
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

function manageCapacites(listToListening, NameClassOfInput) {
  $(listToListening).change(function() {
    var tmp = $(this).parent().text().split("-");
    if(this.checked) {
      if (! $("#f_"+tmp[0].trim()).length) {
        // listenerCapacite("=>"+$(this).parent().text());
        $("."+tmp[1].trim() +" "+ NameClassOfInput).last().parent().append(getHTMLInputCapacite($(this).parent().text(), this.value));
        listenerCapacite("#t_"+format_name(tmp[0].trim()));
      }
    } else {
      $("#t_"+tmp[0].trim()).remove();
    }
  });
}

function manageHistoriques(listToListening, NameClassOfInput) {
  $(listToListening).change(function() {
    console.log("coucou")
    var tmp = $(this).parent().text();
    if(this.checked) {
      if (! $("#f_"+tmp).length) {
        // var id_jointure = $(NameClassOfInput).last().children(".hidden").attr("id").split("_")[1]
        $(NameClassOfInput).last().parent().append(getHTMLInputHistorique($(this).parent().text(), this.value));
        listenerHistorique("#t_"+tmp.trim());
        console.log("coucou")
        listenerHistoriqueForBase("#t_"+tmp.trim());
      }
    } else {
      $("#t_"+tmp).remove();
    }
  });
}

function manageAtouts(listToListening, NameClassOfInput) {
  $(listToListening).change(function() {
    var tmp = $(this).parent().text().split(" (");
    var cout = tmp[1].split(")");
    if(this.checked) {
      if (! $("#f_"+tmp[0]).length) {
        console.log($(NameClassOfInput));
        // $(NameClassOfInput).last().parent().append(getHTMLInputAtout(tmp[0], this.value, cout[0].trim()));
        $("#table-atout tr:last").after(getHTMLInputAtout(tmp[0], this.value, cout[0].trim()));
      }
    } else {
      $("#t_"+tmp).remove();
    }
  });
}

function manageDisciplines(listToListening, NameClassOfInput) {
  $(listToListening).change(function() {
    var tmp = $(this).parent().text();
    if(this.checked) {
      if (! $("#f_"+format_name(tmp)).length) {
        var nbs = $(".dis").length;
        // En fonction du nombre de discipline que possède le personnage, faire poper la discipline sur la bonne colone
        // var id_jointure = $(NameClassOfInput).last().children(".hidden").attr("id").split("_")[1];
        if (nbs == 0 || nbs == 3 || nbs == 6 || nbs == 9 || nbs == 12 || nbs == 15) {
          $(".col-dis-0").append(getHTMLInputDiscipline($(this).parent().text(), this.value, nbs));
        } else if (nbs == 1 || nbs == 4 || nbs == 7 || nbs == 10 || nbs == 13 || nbs == 16) {
          $(".col-dis-1").append(getHTMLInputDiscipline($(this).parent().text(), this.value, nbs));
        } else {
          $(".col-dis-2").append(getHTMLInputDiscipline($(this).parent().text(), this.value, nbs));
        }
        listenerDiscipline("#t_"+format_name(tmp));
      }
    } else {
      $("#t_"+tmp).remove();
    }
  });
}

function manageArts(listToListening, NameClassOfInput) {
  $(listToListening).change(function() {
    var tmp = $(this).parent().text();
    if(this.checked) {
      console.log("wewefwef")
      if (! $("#f_"+format_name(tmp)).length) {
        var nbs = $(".art").length;
        if (nbs == 0 || nbs == 3 || nbs == 6 || nbs == 9 || nbs == 12 || nbs == 15) {
          $(".col-art-0").append(getHTMLInputArt($(this).parent().text(), this.value, nbs));
        } else if (nbs == 1 || nbs == 4 || nbs == 7 || nbs == 10 || nbs == 13 || nbs == 16) {
          $(".col-art-1").append(getHTMLInputArt($(this).parent().text(), this.value, nbs));
        } else {
          $(".col-art-2").append(getHTMLInputArt($(this).parent().text(), this.value, nbs));
        }
        listenerArt("#t_"+format_name(tmp));
      }
    } else {
      $("#t_"+tmp).remove();
    }
  });
}

function manageTypeChangelin() {
  $(".type-changelin input").change(function() {
    if ($(this).val() == "Gamin") {
      $("#personnage_volonte").val(1)
      $("#personnage_glamour").val(5)
      $("#personnage_banalite").val(1)
    } else if ($(this).val() == "Vaurien") {
      $("#personnage_volonte").val(2)
      $("#personnage_glamour").val(4)
      $("#personnage_banalite").val(3)
    } else {
      $("#personnage_volonte").val(5)
      $("#personnage_glamour").val(3)
      $("#personnage_banalite").val(5)
    }
  })
}

function getHTMLInputData(id, type, class_type, nom, format_nom, num, info_bulle, cols_sup, image) {
  var gris = '';
  if (num % 2 == 0) {
    gris = 'gris';
  }
  if (type == "capacite") {
    var type_cap = nom.split("-")[1].trim();
    nom = nom.split("-")[0].trim();
  }
  out = "<div class=\"row "+class_type+" "+gris+"\" id=\"t_"+format_nom+"\">";
    out += "<div class=\"col-md-5\">";
      out += "<b> "+nom+" </b>";
      if (info_bulle) {
        out += "<span class=\"infobulle\"><img src=\"/assets/question_icon.jpg\" class=\"question\"><i>"+info_bulle+"</i></span>";
      }
    out += "</div>";
    out += "<div class=\"col-md-2\">";
      out += "<button type=\"button\" class=\"moins_new\" id=\"minus-"+format_nom+"\" name=\"button\"></button>";
      out += "<button type=\"button\" class=\"plus_new\" id=\"plus-"+format_nom+"\" name=\"button\"></button>";
    out += "</div>";
    out += "<div class=\"control-group integer optional "+type+"s_personnages_niveau col-md-1\">";
    out += "<div class=\"controls\"><input class=\"numeric integer optional inpt_number "+gris+"\" id=\""+type+"s_personnages_niveau\" name=\""+type+"s_personnages[t_"+id+"][niveau]\" step=\"1\" type=\"number\" value=\"0\" readonly=\"true\"/></div></div>";
    if (cols_sup) {
      out += "<div class=\"control-group string optional capacites_personnage s_specialite col-md-4 hidden\" id=\"specialite-"+nom+"\">";
      out += "<label class=\"string optional control-label\" for=\""+type+"s_personnages_specialite\">Specialite</label>";
      out += "<div class=\"controls\"><input class=\"string optional\" id=\""+type+"s_personnages_specialite\" name=\""+type+"s_personnages["+id+"]["+cols_sup+"]\" size=\"50\" type=\"text\" value=\"\" /></div></div>";
    } else {
      out += "<div class=\"col-md-5\"></div>";
    }
    if (type == "capacite") {
      out += "<span class=\"hidden\" id=\""+id+"\"> "+id+":"+type_cap+"</span>"; //TODO FIX type_cap
    } else {
      out += "<span class=\"hidden\" id=\"d_"+id+"\">"+id+"</span>";
    }
  out += "</div>";
  return out;
}

  function format_name(name) {
    return name.split(' ').join("").split("'").join("");
  }

function getHTMLInputDiscipline(name, id, nbs) {
  out = getHTMLInputData(id, "discipline", "dis", name, format_name(name), nbs + 1, "", null, null);
  return out;
}

function getHTMLInputArt(name, id, nbs) {
  out = getHTMLInputData(id, "art", "art", name, format_name(name), nbs + 1, "", null, null);
  return out;
}

function getHTMLInputCapacite(name, id) {
  var nbs = $(".cap").length;
  out = getHTMLInputData(id, "capacite", "cap", name, format_name(name.split("-")[0].trim()), nbs + 1, "", null, null);
  return out;
}

function getHTMLInputHistorique(name, id, id_jointure) {
  var nbs = $(".his").length;
  out = getHTMLInputData(id, "historique", "his", name, format_name(name), nbs + 1, "", null, null);
  return out;
}

function getHTMLInputAtout(name, id, cout) {
  // out = "<div class=\"row ato\" id=\"t_"+name+"\">";
  // out += "<div class=\"col-md-4\">";
  // out += "<b>"+name+"</b>";
  // out += "</div>";
  // out += "<div class=\"col-md-2\">";
  // out += ""+cout+"";
  // out += "</div>";
  // out += "<div class=\"col-md-6\">";
  // out += "</div>";
  // out += "</div>";
  // return out;
  out = "<tr id=\"t_"+name+"\">"
    out += "<td>"+name+"</td>"
    out += "<td>"+cout+"</td>"
    out += "<td></td>"
  out += "</tr>"
  return out;
}

function fusionBaseBonus(base, bonus) {
  var out = {};
  out.Personnage = {};
  out.Capacites = {};
  out.Historiques = {};
  out.Disciplines = {};
  out.Spheres = {};
  out.Arts = {};
  out.Royaumes = {};
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
  out.Personnage["Volonte"] = base.Personnage["Volonte"] + bonus.Personnage["Volonte"];
  out.Personnage["Glamour"] = base.Personnage["Glamour"] + bonus.Personnage["Glamour"];
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
  $.each(bonus.Historiques, function(key, val) {
    if (!out.Historiques[key]) {
      out.Historiques[key] = val;
    }
  });
  if (base.Disciplines) {
    $.each(base.Disciplines, function(key, val) {
      out.Disciplines[key] = val + bonus.Disciplines[key];
    });
  }
  if (bonus.Disciplines) {
    $.each(bonus.Disciplines, function(key, val) {
      if (!out.Disciplines) {
        out.Disciplines[key] = val;
      }
    });
  }
  if (base.Arts) {
    $.each(base.Arts, function(key, val) {
      out.Arts[key] = val + bonus.Arts[key];
    });
  }
  if (bonus.Arts) {
    $.each(bonus.Arts, function(key, val) {
      if (!out.Arts) {
        out.Arts[key] = val;
      }
    });
  }
  if (base.Royaumes) {
    $.each(base.Royaumes, function(key, val) {
      out.Royaumes[key] = val + bonus.Royaumes[key];
    });
  }
  if (bonus.Royaumes) {
    $.each(bonus.Royaumes, function(key, val) {
      if (!out.Royaumes) {
        out.Royaumes[key] = val;
      }
    });
  }
  if (base.Spheres) {
    $.each(base.Spheres, function(key, val) {
      out.Spheres[key] = val + bonus.Spheres[key];
    });
  }
  out = $.extend({}, bonus, out); // for new stuff in bonus
  return out;
}

function manageMenu() {
  $(".close").css("display", "none");
  var isMenuOpen = false;

  $('.menu_btn, .menu_btn2').click(function()
  {
    if (isMenuOpen == false)
    {
    //alert('je suis dans le bon cas')
      $("#menu").clearQueue().animate({
        right : '0'
      })
      $("#page").clearQueue().animate({
        "margin-left" : '-290px'
      })

      $(this).fadeOut(200);
      $(".close").fadeIn(300);

      isMenuOpen = true;
    }
  });

  $('.close').click(function()
  {
    if (isMenuOpen == true)
    {
      $("#menu").clearQueue().animate({
        right : '-240px'
      })
      $("#page").clearQueue().animate({
        "margin-left" : '0px'
      })

      $(this).fadeOut(200);
      $(".menu_btn, .menu_btn2").fadeIn(300);

      isMenuOpen = false;
    }
  });
}

function ShowXps() {
  $("#add-xps").click(function() {
    if ($("#personnage_xps").hasClass('hidden')) {
      $("#personnage_xps").removeClass('hidden');
    } else {
      $("#personnage_xps").addClass('hidden');
    }
  });
}
