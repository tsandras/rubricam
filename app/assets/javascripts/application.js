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
      if ($(this).parent().text().toUpperCase().search(value) > -1 && i < 10) {
          $(this).parent().show();
      } else {
          $(this).parent().hide();
      }
      i = i + 1;
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
