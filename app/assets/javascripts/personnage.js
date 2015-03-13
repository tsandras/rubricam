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
        listenerNumber($(this).attr("id"), "#" + $(this).attr("id") + " #spheres_personnages_niveau", 0, 5);
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

  function listenerCapacite(idCapacite) {
    var tmp = idCapacite.split("_");
    listenerNumber(tmp[1], idCapacite + " #capacites_personnages_niveau", 0, 10);
  }

  function listenerDiscipline(idDiscipline) {
    var tmp = idDiscipline.split("_");
    listenerNumber(tmp[1], idDiscipline + " #disciplines_personnages_niveau", 0, 10);
  }

  function listenerHistorique(idHistorique) {
    var tmp = idHistorique.split("_");
    listenerNumber(tmp[1], idHistorique + " #historiques_personnages_niveau", 0, 10);
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

  // function listenerNumber(name, idInput, min, max) {
  //   listenerUp("#plus-"+name, idInput, max);
  //   listenerDown("#minus-"+name, idInput, min);
  // }

  // function listenerUp(idButton, idInput, max) {
  //   $(idButton).click(function() {
  //     if (parseInt($(idInput).val()) < max) {
  //       console.log("coucou ?");
  //       manageShowSpecialite(parseInt($(idInput).val()) + 1, idButton);
  //       $(idInput).val(parseInt($(idInput).val()) + 1);
  //       manageNiveauVoie(idButton, 1);
  //       manageCalculeXps($("#personnage_type_perso").val());
  //       manageCalculeBonus();
  //     }
  //   });
  // }

  // function listenerDown(idButton, idInput, min) {
  //   $(idButton).click(function() {
  //     if (parseInt($(idInput).val()) > min) {
  //       manageShowSpecialite(parseInt($(idInput).val()) - 1, idButton);
  //       $(idInput).val(parseInt($(idInput).val()) - 1);
  //       manageNiveauVoie(idButton, -1);
  //       manageCalculeXps($("#personnage_type_perso").val());
  //       manageCalculeBonus();
  //     }
  //   });
  // }

  function listenerPhysiqueForBase(min, max) {
    liste_attributs = ["#personnage_force", "#personnage_dexterite", "#personnage_vigueur"];
    if (!gon.base) {
      $.each(liste_attributs, function(key, val) {
        tmp = val.split("_");
        $("#plus-"+tmp[1]).click(function() {
          if (parseInt($(this).parent().parent().children(".control-group").children(".controls").children("input").val()) + 1 < max) {
            if (parseInt($("#nbs_physique").html().trim()) < 7) {
              $("#nbs_physique").html(" "+(parseInt($("#nbs_physique").html()) + 1));
            }
          }
        });
        $("#minus-"+tmp[1]).click(function() {
          if (parseInt($(this).parent().parent().children(".control-group").children(".controls").children("input").val()) >= min) {
            if (parseInt($("#nbs_physique").html().trim()) > 0) {
              $("#nbs_physique").html(" "+(parseInt($("#nbs_physique").html()) -1));
            }
          }
        });
      });
    }
  }

  function listenerMentalForBase(min, max) {
    liste_attributs = ["#personnage_intelligence", "#personnage_perception", "#personnage_astuce"];
    if (!gon.base) {
      $.each(liste_attributs, function(key, val) {
        tmp = val.split("_");
        $("#plus-"+tmp[1]).click(function() {
          if (parseInt($(this).parent().parent().children(".control-group").children(".controls").children("input").val()) + 1 < max) {
            if (parseInt($("#nbs_mental").html().trim()) < 7) {
              $("#nbs_mental").html(" "+(parseInt($("#nbs_mental").html()) + 1));
            }
          }
        });
        $("#minus-"+tmp[1]).click(function() {
          if (parseInt($(this).parent().parent().children(".control-group").children(".controls").children("input").val()) >= min) {
            if (parseInt($("#nbs_mental").html().trim()) > 0) {
              $("#nbs_mental").html(" "+(parseInt($("#nbs_mental").html()) -1));
            }
          }
        });
      });
    }
  }

  function listenerSocialForBase(min, max) {
    liste_attributs = ["#personnage_apparence", "#personnage_manipulation", "#personnage_charisme"];
    if (!gon.base) {
      $.each(liste_attributs, function(key, val) {
        tmp = val.split("_");
        $("#plus-"+tmp[1]).click(function() {
          if (parseInt($(this).parent().parent().children(".control-group").children(".controls").children("input").val()) + 1 < max) {
            if (parseInt($("#nbs_social").html().trim()) < 7) {
              $("#nbs_social").html(" "+(parseInt($("#nbs_social").html()) + 1));
            }
          }
        });
        $("#minus-"+tmp[1]).click(function() {
          if (parseInt($(this).parent().parent().children(".control-group").children(".controls").children("input").val()) >= min) {
            if (parseInt($("#nbs_social").html().trim()) > 0) {
              $("#nbs_social").html(" "+(parseInt($("#nbs_social").html()) -1));
            }
          }
        });
      });
    }
  }

  // ClassType = Talent, idOutput = #nbs_talent
  function listenerTypeCapacitesForBase(ClassType, idOutput, min, max) {
    if (!gon.base) {
      $.each($(".cap"), function(key, val) {
        if ($(this).parent().hasClass(ClassType)) {
          var tmp = $(this).attr("id").split("_");
          // listenerNumber(tmp[1], "#" + $(this).attr("id") + " #capacites_personnages_niveau", 0, 10);
          $("#plus-"+tmp[1]).click(function() {
            if ((parseInt($(this).parent().parent().children(".control-group").children(".controls").children("input").val()) + 1) < max) {
              if (parseInt($(idOutput).html().trim()) < 13) {
                $(idOutput).html(" "+(parseInt($(idOutput).html()) + 1));
              }
            }
          });
          $("#minus-"+tmp[1]).click(function() {
            if (parseInt($(this).parent().parent().children(".control-group").children(".controls").children("input").val()) >= min) {
              if (parseInt($(idOutput).html().trim()) > 0) {
                $(idOutput).html(" "+(parseInt($(idOutput).html()) - 1));
              }
            }
          });
        }
      });
    }
  }

  function listenerHistoriquesForBase(min) {
    var max = parseInt($("#max_historiques").html());
    $.each($(".his"), function(key, val) {
      if ($(this).attr("id")) {
        var tmp = $(this).attr("id").split("_");
        $("#plus-"+tmp[1]).click(function() {
          if ($("#nbs_historiques").length == 0 || parseInt($("#nbs_historiques").html().trim()) < max) {
            $("#nbs_historiques").html(" "+(parseInt($("#nbs_historiques").html()) + 1));
          }
        });
        $("#minus-"+tmp[1]).click(function() {
          if ($("#nbs_historiques").length == 0 || parseInt($("#nbs_historiques").html().trim()) > min) {
            $("#nbs_historiques").html(" "+(parseInt($("#nbs_historiques").html()) - 1));
          }
        });
      }
    });
  }

  function listenerHistoriqueForBase(idWrapper, min) {
    var max = parseInt($("#max_historiques").html());
    if ($(idWrapper).attr("id")) {
      var tmp = $(idWrapper).attr("id").split("_");
      $("#plus-"+tmp[1]).click(function() {
        if ($("#nbs_historiques").length == 0 || parseInt($("#nbs_historiques").html().trim()) < max) {
          $("#nbs_historiques").html(" "+(parseInt($("#nbs_historiques").html()) + 1));
        }
      });
      $("#minus-"+tmp[1]).click(function() {
        if ($("#nbs_historiques").length == 0 || parseInt($("#nbs_historiques").html().trim()) > min) {
          $("#nbs_historiques").html(" "+(parseInt($("#nbs_historiques").html()) - 1));
        }
      });
    }
  }

  function listenerSpheresForBase() {
    var max = parseInt($("#max_spheres").html());
    $.each($(".sph"), function(key, val) {
      if ($(this).attr("id")) {
        var name = $(this).attr("id");
        $("#plus-"+name).click(function() {
          if ($("#nbs_historiques").length == 0 || parseInt($("#nbs_spheres").html().trim()) < max) {
            $("#nbs_spheres").html(" "+(parseInt($("#nbs_spheres").html()) + 1));
          }
        });
        $("#minus-"+name).click(function() {
          if ($("#nbs_historiques").length == 0 || parseInt($("#nbs_spheres").html().trim()) > min) {
            $("#nbs_spheres").html(" "+(parseInt($("#nbs_spheres").html()) - 1));
          }
        });
      }
    });
  }

  function listenerVertuesForBase() {
    var liste_vertues = ["#personnage_points_conscience", "#personnage_points_maitrise", "#personnage_points_courage"];
    if (!gon.base) {
      var max = parseInt($("#max_vertues").html());
      $.each(liste_vertues, function(key, val) {
        var tmp = val.split("_");
        $("#plus-"+tmp[2]).click(function() {
          if (parseInt($("#nbs_vertues").html().trim()) < max) {
            $("#nbs_vertues").html(" "+(parseInt($("#nbs_vertues").html()) + 1));
          }
        });
        $("#minus-"+tmp[2]).click(function() {
          if (parseInt($("#nbs_vertues").html().trim()) > 0) {
            $("#nbs_vertues").html(" "+(parseInt($("#nbs_vertues").html()) - 1));
          }
        });
      });
    }
  }

  function listenerDisciplinesForBase() {
    if ($("#nbs_disciplines").val() != null) {
      $.each($(".dis"), function(key, val) {
        if ($(this).attr("id")) {
          var tmp = $(this).attr("id").split("_");
          name = tmp[1].split(" ").join("").split("'").join("");
          $("#plus-"+name).click(function() {
            if (parseInt($("#nbs_disciplines").html().trim()) < 4) {
              $("#nbs_disciplines").html(" "+(parseInt($("#nbs_disciplines").html()) + 1));
            }
          });
          $("#minus-"+name).click(function() {
            if (parseInt($("#nbs_disciplines").html().trim()) > 0) {
              $("#nbs_disciplines").html(" "+(parseInt($("#nbs_disciplines").html()) - 1));
            }
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
        var id_jointure = $(NameClassOfInput).last().children(".hidden").attr("id").split("_")[1]
        $(NameClassOfInput).last().parent().append(getHTMLInputHistorique($(this).parent().text(), this.value, id_jointure));
        listenerHistorique("#t_"+tmp.trim());
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
        $(NameClassOfInput).last().parent().append(getHTMLInputAtout(tmp[0], this.value, cout[0].trim()));
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
      if (! $("#f_"+tmp).length) {
        var nbs = $(".dis").length;
        // En fonction du nombre de discipline que possède le personnage, faire poper la discipline sur la bonne colone
        var id_jointure = $(NameClassOfInput).last().children(".hidden").attr("id").split("_")[1];
        if (nbs == 0 || nbs == 3 || nbs == 6 || nbs == 9 || nbs == 12 || nbs == 15) {
          $(".col-dis-0").append(getHTMLInputDiscipline($(this).parent().text(), this.value, id_jointure, nbs));
        } else if (nbs == 1 || nbs == 4 || nbs == 7 || nbs == 10 || nbs == 13 || nbs == 16) {
          $(".col-dis-1").append(getHTMLInputDiscipline($(this).parent().text(), this.value, id_jointure, nbs));
        } else {
          $(".col-dis-2").append(getHTMLInputDiscipline($(this).parent().text(), this.value, id_jointure, nbs));
        }
        listenerDiscipline("#t_"+tmp);
      }
    } else {
      $("#t_"+tmp).remove();
    }
  });
}

function getHTMLInputData(id, type, class_type, nom, format_nom, num, info_bulle, cols_sup, image) {
  var gris = '';
  if (num % 2 == 0) {
    gris = 'gris';
  }
  if (type == "capacite") {
    nom = nom.split("-")[0].trim();
    var type_cap = nom.split("-")[1].trim();
  }
  out = "<div class=\"row "+class_type+" "+gris+"\" id=\"t_"+format_nom+"\">";
    out += "<div class=\"col-md-4\">";
      out += "<b> "+nom+" </b>";
      if (info_bulle) {
        out += "<span class=\"infobulle\"><img src=\"/assets/question_icon.jpg\" class=\"question\"><i>"+info_bulle+"</i></span>";
      }
    out += "</div>";
    out += "<div class=\"col-md-2\">";
      out += "<button type=\"button\" class=\"moins_new\" id=\"minus-"+nom+"\" name=\"button\"></button>";
      out += "<button type=\"button\" class=\"plus_new\" id=\"plus-"+nom+"\" name=\"button\"></button>";
    out += "</div>";
    // simple_fields_for(objet) do |o|
      // out += o.input(:niveau, label: "&nbsp;";,
      //         input_html: {name: "#{type}s_personnages[#{objet.id}][niveau]", class: "inpt_number #{num % 2 == 0 ? 'gris' : ''}", readonly: 'true' },
      //         wrapper_html: { class: "col-md-1 reajuste" })
      out += "<div class=\"control-group integer optional "+type+"s_personnages_niveau col-md-1 reajuste\">";
      out += "<label class=\"integer optional control-label\" for=\""+type+"s_personnages_niveau\">&nbsp;</label>"
      out += "<div class=\"controls\"><input class=\"numeric integer optional inpt_number "+gris+"\" id=\""+type+"s_personnages_niveau\" name=\""+type+"s_personnages[t_"+id+"][niveau]\" step=\"1\" type=\"number\" value=\"0\" readonly=\"true\"/></div></div>";
      if (cols_sup) {
        out += "<div class=\"control-group string optional capacites_personnage s_specialite col-md-6 hidden reajuste-spe\" id=\"specialite-"+nom+"\">";
        out += "<label class=\"string optional control-label\" for=\""+type+"s_personnages_specialite\">Specialite</label>";
        out += "<div class=\"controls\"><input class=\"string optional inpt_string\" id=\""+type+"s_personnages_specialite\" name=\""+type+"s_personnages["+id+"]["+cols_sup+"]\" size=\"50\" type=\"text\" value=\"\" /></div></div>";
        // out += o.input(cols_sup, label: "&nbsp";,
        //         input_html: {class: "inpt_string", name: "#{type}s_personnages[#{objet.id}][#{cols_sup}]"},
        //         wrapper_html: { class: "col-md-5 reajuste #{specialite_affichage(objet, cols_sup)}", id: "#{cols_sup}-#{format_nom}" })
      } else {
        out += "<div class=\"col-md-5\"></div>";
      }
    // end
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

function getHTMLInputDiscipline(name, id, id_jointure, nbs) {
  // var id_j = parseInt(id_jointure) + 1;
  // out = "<div class=\"dis\" id=\"t_"+name+"\">";
  // out += "<div class=\"col-md-6\">";
  // out += "<b>"+name+"</b>"
  // out += "</div>"
  // out += "<div class=\"control-group integer optional disciplines_personnages_niveau col-md-6\">";
  // out += "<label class=\"integer optional control-label\" for=\"disciplines_personnages_niveau\"></label>";
  // out += "<div class=\"controls\">";
  // out += "<input class=\"numeric integer optional\" id=\"disciplines_personnages_niveau\" name=\"disciplines_personnages["+id+"][niveau]\" step=\"1\" type=\"number\" value=\"\" /></div>";
  // out += "<span class=\"hidden\" id=\""+id+"\">"+id+"</span>";
  // out += "</div>"
  out = getHTMLInputData(id, "discipline", "dis", name, format_name(name), nbs + 1, "", null, null);
  return out;
}

function getHTMLInputCapacite(name, id) {
  // tmp = name.split("-");
  // out = "<div class=\"row cap\" id=\"t_"+tmp[0].trim()+"\">";
  // out += "<div class=\"col-md-4\">";
  // out += "<b>"+tmp[0].trim()+"</b>";
  // out += "</div>";
  // out += "<button type=\"button\" class=\"moins_cap\" id=\"minus-"+tmp[0].trim()+"\" name=\"button\"></button>";
  // out += "<button type=\"button\" class=\"plus_cap\" id=\"plus-"+tmp[0].trim()+"\" name=\"button\"></button>";
  // out += "<div class=\"control-group integer optional capacites_personnages_niveau col-md-2\">";
  // out += "<label class=\"integer optional control-label\" for=\"capacites_personnages_niveau\"> </label>"
  // out += "<div class=\"controls\"><input class=\"numeric integer optional inpt_number\" id=\"capacites_personnages_niveau\" name=\"capacites_personnages["+id+"][niveau]\" step=\"1\" type=\"number\" value=\"0\" readonly=\"true\"/></div></div>";
  // out += "<div class=\"control-group string optional capacites_personnage s_specialite col-md-6 hidden reajuste-spe\" id=\"specialite-"+tmp[0].trim()+"\">";
  // out += "<label class=\"string optional control-label\" for=\"capacites_personnages_specialite\">Specialite</label>";
  // out += "<div class=\"controls\"><input class=\"string optional inpt_string\" id=\"capacites_personnages_specialite\" name=\"capacites_personnages["+id+"][specialite]\" size=\"50\" type=\"text\" value=\"\" /></div></div>";
  // out += "<span class=\"hidden\" id=\""+id+"\">"+id+":"+tmp[1].trim()+"</span>";
  // out += "</div>"
  var nbs = $(".cap").length;
  out = getHTMLInputData(id, "capacite", "cap", name, format_name(name), nbs + 1, "", null, null);
  return out;
}

function getHTMLInputHistorique(name, id, id_jointure) {
  // var id_j = parseInt(id_jointure) + 1;
  // var id_lol = "t_" + id;
  // out = "<div class=\"row his\" id=\"t_"+name+"\">";
  // out += "<div class=\"col-md-4\">";
  // out += "<b>"+name+"</b>"
  // out += "</div>"
  // out += "<button type=\"button\" class=\"moins_cap\" id=\"minus-"+name+"\" name=\"button\"></button>";
  // out += "<button type=\"button\" class=\"plus_cap\" id=\"plus-"+name+"\" name=\"button\"></button>";
  // out += "<div class=\"control-group integer optional historiques_personnages_niveau col-md-2\">";
  // out += "<label class=\"integer optional control-label\" for=\"historiques_personnages_niveau\"></label>";
  // out += "<div class=\"controls\">";
  // out += "<input class=\"numeric integer optional inpt_number\" id=\"historiques_personnages_niveau\" name=\"historiques_personnages["+id_lol+"][niveau]\" step=\"1\" type=\"number\" value=\"0\" readonly=\"true\" /></div>";
  // out += "<span class=\"hidden\" id=\""+id+"\">"+id+"</span>";
  // // put id="id_generate_al"
  // out += "</div>"
  // out += "<div class=\"col-md-6\"></div>"
  var nbs = $(".his").length;
  out = getHTMLInputData(id, "historique", "his", name, format_name(name), nbs + 1, "", null, null);
  return out;
}

function getHTMLInputAtout(name, id, cout) {
  out = "<div class=\"row ato\" id=\"t_"+name+"\">";
  out += "<div class=\"col-md-4\">";
  out += "<b>"+name+"</b>";
  out += "</div>";
  out += "<div class=\"col-md-2\">";
  out += ""+cout+"";
  out += "</div>";
  out += "<div class=\"col-md-6\">";
  out += "</div>";
  out += "</div>";
  return out;
}

function fusionBaseBonus(base, bonus) {
  var out = {};
  out.Personnage = {};
  out.Capacites = {};
  out.Historiques = {};
  out.Disciplines = {};
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
  $.each(base.Disciplines, function(key, val) {
    console.log(val, bonus.Disciplines[key], key);
    out.Disciplines[key] = val + bonus.Disciplines[key];
  });
  if (base.Sphere) {
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
