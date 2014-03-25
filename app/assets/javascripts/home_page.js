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
  * Index Home page
  ***************************************************
  ***************************************************
  * Create tutorial ajax
  ***************************************************/

  $(document).on("click", ".create-tutorial-link", function(e){
    e.preventDefault();
    var url = $(this).attr("href")
  
    $.get(url, function(serverResponse, status, request){
      populatePopup(serverResponse);
    })
  })

  /**************************************************
  *  ajax Sign up and Sign in
  ***************************************************/

  $(document).on("click", ".sign-up-link",function(e){
    e.preventDefault()
    $.get("/users/ajax/sign_up", function(serverResponse, status, request){
      populatePopup(serverResponse);
      appendX();
    })
  });

  $(document).on("click", "#sign-in-link",function(e){
    e.preventDefault()
    $.get("/users/ajax/sign_in", function(serverResponse, status, request){
      populatePopup(serverResponse);
      appendX();
    })
  });

});
