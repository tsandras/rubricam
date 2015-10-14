// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.placeholder.min
//= require jquery_ujs
//= require jquery-ui-1.10.custom.min
//= require jquery-ui-timepicker-addon
//= require jquery-cbtoggle
//= require core
//= require personnage
//= require personnage_xp
//= require select2
//= require_tree .

function listenerNumber(name, idInput, min, max) {
    listenerUp("#plus-"+name, idInput, max);
    listenerDown("#minus-"+name, idInput, min);
  }

function listenerUp(idButton, idInput, max) {
  $(idButton).click(function() {
    if (parseInt($(idInput).val()) < max) {
      manageShowSpecialite(parseInt($(idInput).val()) + 1, idButton);
      $(idInput).val(parseInt($(idInput).val()) + 1);
      manageNiveauVoie(idButton, 1);
      manageCalculeXps($("#personnage_type_perso").val());
      manageCalculeBonus();
    }
  });
}

function listenerDown(idButton, idInput, min) {
  $(idButton).click(function() {
    if (parseInt($(idInput).val()) > min) {
      manageShowSpecialite(parseInt($(idInput).val()) - 1, idButton);
      $(idInput).val(parseInt($(idInput).val()) - 1);
      manageNiveauVoie(idButton, -1);
      manageCalculeXps($("#personnage_type_perso").val());
      manageCalculeBonus();
    }
  });
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
  var i = 0;
  $(filteringList).each(function() {
      // console.log($(this).parent().text());
      if ($(this).parent().text().toUpperCase().search(value) > -1 && i < 10) {
          $(this).parent().show();
          i = i + 1;
      } else {
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

// MAP here

function init_map_admin(lieux_villes) {
  var lieux = lieux_villes;
  var svg = document.querySelector('svg');

  ManageCursorPoint(svg);
  addPoints(lieux, svg);
}

function ManageCursorPoint(svg) {
  // Create an SVGPoint for future math
  var pt = svg.createSVGPoint();
  svg.addEventListener('click',function(evt){
    var loc = cursorPoint(evt, pt, svg);
    console.log("("+loc.x+";"+loc.y+")");
  },false);
}

// Get point in global SVG space
function cursorPoint(evt, pt, svg){
  pt.x = evt.clientX; pt.y = evt.clientY;
  return pt.matrixTransform(svg.getScreenCTM().inverse());
}

function zoom(svg) {
  // Zoom
  var panZoomTiger = svgPanZoom(svg, {minZoom: 1});

  $('#world-map-svg').css({
    'height':'510px',
    'width':'750px'
  });
}

function addPoints(lieux, svg, user) {
  // Ajout des points
  // var map = $('#layer1');
  for (i in lieux) {
    console.log(lieux[i]);
    // var s = '<circle style="opacity:1;fill:#00ffff;fill-opacity:1;stroke:none;stroke-opacity:1" id="lieu-'+lieux[i].id+'" cx="'+lieux[i].svg_x+'" cy="'+lieux[i].svg_y+'" r="5" />';
    // console.log(s);
    // map.after(s);
    if (lieux[i].svg_x != null && lieux[i].svg_y != null) {
      var newElement = document.createElementNS("http://www.w3.org/2000/svg", 'circle'); //Create a path in SVG's namespace
      newElement.setAttributeNS(null, "cx", parseFloat(lieux[i].svg_x));
      newElement.setAttributeNS(null, "cy", parseFloat(lieux[i].svg_y));
      newElement.setAttributeNS(null, "r", 0.5);
      newElement.setAttributeNS(null, "fill", "green");
      newElement.setAttributeNS(null, "uid", "uid"+lieux[i].id);
      newElement.setAttributeNS(null, "class", "point");
      // newElement.style.stroke = "#000"; //Set stroke colour
      // newElement.style.strokeWidth = "1px"; //Set stroke width
      svg.appendChild(newElement);
      setDataLieu(lieux[i], user);
    }
  }
}

function init_map(lieux_villes, user) {
  var lieux = lieux_villes;
  var svg = document.querySelector('svg');

  ManageCursorPoint(svg);
  addPoints(lieux, svg, user);
  zoom(svg);
}

function setDataLieu(lieu, user) {
  out = "";
  out += "<b>"+lieu.nom+"</b><br/>";
  lieu.organisations.forEach(function(organisation) {
    if (!organisation.secret || user.role == 2) {
      out += "["+organisation.type_organisation+"] ";
      out += "<a href='/organisations/"+organisation.id+"'>"+organisation.nom+"</a><br/>";
      out += ""+organisation.description_publique+"<br/>";
    }
  });
  lieu.personnages.forEach(function(personnage) {
    if (!personnage.secret || user.role == 2) {
      out += "<a href='/personnages/"+personnage.id+"/public_show'>"+personnage.nom+" "+personnage.prenom+"</a><br/>";
    }
  });
  $("#list-data-lieux").append("<div id='uid"+lieu.id+"' class='data-lieu'>"+out+"</div>");
}

function managerDataLieu() {
  $(".point").on("click", function() {
    $(".data-lieu").hide();
    $("#"+$(this).attr("uid")).show();
  });
}

function manageActiveDiv() {
  $("#my-nav li").on("click", function() {
    $(this).addClass("active");
  });
}
