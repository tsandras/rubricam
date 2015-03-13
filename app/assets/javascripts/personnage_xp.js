function whenclickCalculeXpsDep(type_perso, idButton) {
  $(idButton).click(function() {
    manageCalculeXps(type_perso);
  });
}

function manageCalculeXps(type_perso) {
  var xps_dep = 0;
  var personnage_base = $("#personnage_caracteristique_base").val();
  var personnage_bonus = $("#personnage_caracteristique_bonus").val();
  if (personnage_base && personnage_bonus) {
    var personnage = fusionBaseBonus(jQuery.parseJSON(personnage_base), jQuery.parseJSON(personnage_bonus));
    console.log(personnage["Disciplines"]);
    xps_dep += calcule_xps_attribut(personnage, type_perso, "base");
    xps_dep += calcule_xps_capacite(personnage, type_perso, "base");
    xps_dep += calcule_xps_historique(personnage, type_perso, "base");
    xps_dep += calcule_xps_atout(personnage, type_perso, "base");
    console.log("Xps dépensé apres atout :"+xps_dep);
    xps_dep += calcule_xps_sphere(personnage, type_perso, "base");
    console.log("Xps dépensé apres spheres :"+xps_dep);
    xps_dep += calcule_xps_discipline(personnage, type_perso, "base");
    console.log("Xps dépensé apres discipline :"+xps_dep);
    xps_dep += calcule_xps_volonte(personnage, type_perso, "base");
    var xps = $("#personnage_xps").val();
    console.log(xps-xps_dep);
    $("#personnage_reste_xps").val(xps-xps_dep);
    $("#reste_xps").text(xps-xps_dep);
  }
}

function manageCalculeBonus() {
  console.log("Coucou manage bonus !");
  var bonus_dep = 0;
  var personnage_base = $("#personnage_caracteristique_base").val();
  var personnage_bonus = $("#personnage_caracteristique_bonus").val();
  if (personnage_base && personnage_bonus.length == 0) {
    var personnage = jQuery.parseJSON(personnage_base);
    bonus_dep += calcule_xps_attribut(personnage, "necrodancer", "bonus");
    bonus_dep += calcule_xps_capacite(personnage, "necrodancer", "bonus");
    bonus_dep += calcule_xps_historique(personnage, "necrodancer", "bonus");
    bonus_dep += calcule_xps_atout(personnage, "necrodancer", "bonus");
    bonus_dep += calcule_xps_sphere(personnage, "necrodancer", "bonus");
    bonus_dep += calcule_xps_discipline(personnage, "necrodancer", "bonus");
    bonus_dep += calcule_xps_volonte(personnage, "necrodancer", "bonus");

    $("#nbs_bonus").html(bonus_dep);
  }
}

function calcule_xps_attribut(personnage, type_perso, type) {
  liste_attributs = ["personnage_force", "personnage_dexterite", "personnage_vigueur",
                      "personnage_charisme", "personnage_manipulation", "personnage_apparence",
                      "personnage_perception", "personnage_intelligence", "personnage_astuce"];
  var out = 0;
  $.each(liste_attributs, function(key, val) {
    attr_actuet = $("#"+val).val();
    tmp = val.split("_");
    if (type == "base") {
      out = out + manage_serie_nx(personnage.Personnage[tmp[1]], attr_actuet, type_perso, "attribut");
    } else {

      out = out + manage_bonus(personnage.Personnage[tmp[1]], parseInt(attr_actuet), "attribut");
    }
  });
  return out;
}

function calcule_xps_capacite(personnage, type_perso, type) {
  var out = 0;
  $("#capacites_personnages_niveau[name^=capacites_personnages]").each(function() {
    var tmp = $("#"+extract_id_cp($(this).attr("name"))).text();
    var idd = tmp.split(":")[0].trim();
    var ty = tmp.split(":")[1];
    var va_actuel = $(this).val();
    var va_avant = 0;
    if (ty == "Talent") {
      va_avant = personnage.Capacites.Talent[idd];
    } else if (ty == "Compétence") {
      va_avant = personnage.Capacites.Competence[idd];
    } else {
      va_avant = personnage.Capacites.Connaissance[idd];
    }
    if (type == "base") {
      out = out + manage_serie_nx(va_avant, parseInt(va_actuel), type_perso, "capacite");
    } else  {
      out = out + manage_bonus(va_avant, parseInt(va_actuel), "capacite");
    }
  });
  return out;
}

function calcule_xps_historique(personnage, type_perso, type) {
  var out = 0;
  $("#historiques_personnages_niveau[name^=historiques_personnages]").each(function() {
    var idd = $("#h_"+extract_id_cp($(this).attr("name"))).text();
    var va_actuel = $(this).val();
    var va_avant = personnage.Historiques[idd.toString()];
    if (! va_avant) {
      va_avant = 0;
    }
    if (type == "base") {
      out = out + manage_serie_nx(va_avant, parseInt(va_actuel), type_perso, "historique");
    } else {
      out = out + manage_bonus(va_avant, parseInt(va_actuel), "historique");
    }
  });
  return out;
}

function calcule_xps_atout(personnage, type_perso, type) {
  var out = 0;
  $("input[id^=personnage_atout_ids]").each(function() {
    if ($(this).attr("checked") == "checked") {
      var vala = parseInt(extract_val_atout($(this).parent().text()));
      var ida = parseInt(extract_id_atout($(this).attr("id")));
      if (! personnage.Atouts[ida]) {
        if (type == "base") {
          out = out + parseInt(vala) * 3;
        } else {
          out = out + parseInt(vala);
        }
      }
    }
  });
  return out;
}

function calcule_xps_sphere(personnage, type_perso, type) {
  var out = 0;
  $("input[id^=spheres_personnages_niveau]").each(function() {
    var valeur_act = $(this).val()
    var idsph = parseInt(extract_id_cp($(this).attr("name")));
    var valeur_av = personnage.Spheres[idsph.toString()];
    if (type == "base") {
      out = out + manage_serie_nx(valeur_av, parseInt(valeur_act), type_perso, "sphere");
    } else {
      out = out + manage_bonus(valeur_av, parseInt(valeur_act), "sphere");
    }
  });
  return out;
}

function calcule_xps_discipline(personnage, type_perso, type) {
  var out = 0;
  $("#disciplines_personnages_niveau[name^=disciplines_personnages]").each(function() {
    var idd = $("#d_"+extract_id_cp($(this).attr("name"))).text();
    var va_actuel = $(this).val();
    var va_avant = personnage.Disciplines[idd.toString()];
    console.log("La valeur avant =>"+va_avant)
    if (! va_avant) {
      va_avant = 0;
    }
    if (type == "base") {
      out = out + manage_serie_nx(va_avant, parseInt(va_actuel), type_perso, "discipline");
    } else {
      out = out + manage_bonus(va_avant, parseInt(va_actuel), "discipline");
    }
  });
  return out;
}

function calcule_xps_volonte(personnage, type_perso, type) {
  var out = 0;
  var va_actuel = $("#personnage_volonte").val();
  var va_avant = personnage.Volonte;
  if (type == "base") {
    out = out + manage_serie_nx(va_avant, parseInt(va_actuel), type_perso, "volonte");
  } else {
    out = out + manage_bonus(va_avant, parseInt(va_actuel), "volonte");
  }
  return out;
}

function extract_id_cp(name) {
  tmp = name.split("[");
  tmp2 = tmp[1].split("]");
  return tmp2[0];
}

function extract_val_atout(name) {
  tmp = name.split("(");
  tmp2 = tmp[1].split(")");
  return tmp2[0];
}

function extract_id_atout(name) {
  tmp = name.split("_");
  return tmp[3];
}

function serie_nx_precedant(i, n, x, base) {
  if (i > n) {
    return 0;
  }
  var out = 0;
  for (j = i; j < n; j++) {
    if (j == 0) {
      out = out + base;
    } else {
      out = out + j*x;
    }
  }
  return out;
}

function serie_nx_suivant(i, n, x, base) {
  if (i > n) {
    return 0;
  }
  var out = 0;
  for (j = i; j < n; j++) {
    if (j == 0) {
      out = out + base;
    } else {
      out = out + (j+1)*x;
    }
  }
  return out;
}

// Tous les personnages dépensent l'expérieure de la même manière sauf les
// Mages avec l'Entelechie et les Spheres.
function manage_serie_nx(i, n, type_perso, pouvoir) {
  var base = get_base(pouvoir);
  var cout = get_cout(pouvoir, type_perso);
  if (n < 6 && pouvoir != "entelechie" && pouvoir != "sphere") {
    return serie_nx_precedant(i, n, cout, base);
  } else if (pouvoir == "entelechie" || pouvoir == "sphere") {
    return serie_nx_suivant(i, n, cout, base);
  } else if (n >= 6) {
    return serie_nx_precedant(i, 6, base, cout) + serie_nx_suivant(6, n, base, cout);
  } else {
    return serie_nx_precedant(i, n, base, cout);
  }
}

function manage_bonus(i, n, pouvoir) {
  var cout = get_cout_bonus(pouvoir);

  return serie_bonus(i, n, cout);
}

function serie_bonus(i, n, cout) {
  if (i > n) {
    return 0;
  }
  var out = 0;
  for (j = i; j < n; j++) {
    out = out + cout;
  }

  return out;
}

function get_base(pouvoir) {
  var out = 0;
  switch (pouvoir) {
    case "discipline":
      out = 10;
      break;
    case "sphere":
      out = 10;
      break;
    case "capacite":
      out = 3;
      break;
    case "attribut":
      out = 4;
      break;
    case "historique":
      out = 3;
      break;
    case "volonte":
      out = 0;
      break;
  }
  return out;
}

function get_cout_bonus(pouvoir) {
  switch (pouvoir) {
    case "discipline":
      out = 7;
      break;
    case "sphere":
      out = 7;
      break;
    case "capacite":
      out = 2;
      break;
    case "attribut":
      out = 4;
      break;
    case "historique":
      out = 1;
      break;
    case "volonte":
      out = 1;
      break;
  }
  return out;
}

function get_cout(pouvoir, type_perso) {
  var out = 0;
  switch (pouvoir) {
    case "discipline":
      if (type_perso = "Vampire") {
        out = 5;
      } else {
        out = 15;
      }
      break;
    case "sphere":
      out = 8;
      break;
    case "capacite":
      out = 2;
      break;
    case "attribut":
      out = 4;
      break;
    case "historique":
      out = 3;
      break;
    case "volonte":
      out = 2;
      break;
  }
  return out;
}
