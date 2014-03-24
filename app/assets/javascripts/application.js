// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require ace/ace
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ 
  $(document).foundation(); 
  
  /*******************************************************************
  * Helper methods
  ********************************************************************/

    // Makes border of element red
    var invalidInput = function(field){
      $(field).css("border-color", "red")
    }

    // Appends an x to popup window #modal-popup
    var appendX = function(){
      $("#modal-popup").append("<a class='close-reveal-modal'>&#215;</a>")
    }

    // Return id from url
    var getId = function(url){
      return url.match(/\d+/)[0]
    }

    // Removes modal popup of the screen
    var removePopup = function(){
      $("#modal-popup").foundation("reveal", "close");
    }

    var populatePopup = function(content){
      $("#modal-popup").html(content);
      appendX();
    }
  /**************************************************
  * Create tutorial ajax
  ***************************************************/

  $(".create-tutorial-link").on("click", function(e){
    e.preventDefault();
    var url = $(this).attr("href")
    $.get(url, function(serverResponse, status, request){
      populatePopup(serverResponse);
    })
  })

  /**************************************************
  *  ajax
  ***************************************************/

  $("#sign-up-link-index").on("click", function(e){
    e.preventDefault()
    $.get("/users/ajax/sign_up", function(serverResponse, status, request){
    $("#modal-popup").html(serverResponse);
    appendX();
  })
  });


});






