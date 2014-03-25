
$(function(){
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

  $(document).on("click", ".sub-chapter-link", function(e){
    e.preventDefault();
    var url = $(this).attr("href");

    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse);
      appendX()
    });
  });

  /************************************************************************
  * Tutorial show page
  *************************************************************************
  *************************************************************************
  * Pull in full sub chapter for reading the contents if user not creator
  *************************************************************************/

  /************************************************************************
   *  Helper method to switch the arrow down or up when it is clicked
   ************************************************************************/


  var switchArrow = function(link){
    var icon = $(link).children()[0]
    if ($(icon).attr("class").match("down") !== null) {
      $(icon).removeClass("fa fa-arrow-circle-o-down fa-2x");
      $(icon).addClass("fa fa-arrow-circle-o-up fa-2x");
    } else {
      $(icon).removeClass("fa fa-arrow-circle-o-up fa-2x");
      $(icon).addClass("fa fa-arrow-circle-o-down fa-2x");
      $(link).attr("class", "sub-cpt-list")
    }
  }

  /************************************************************************
  * Pull in/ take out sub chapters list for the clicked chapter arrow
  *************************************************************************/

  $(document).on("click", "#chapter-list .sub-cpt-list",  function(e){
    e.preventDefault();
    var link = this;

    if ($(this).attr('class').match("add-list") !== null){
      bring_list(link);
    } else {
      take_list_off(link);
    }
  })

  var bring_list = function(link){
    switchArrow(link);
    var url = $(link).attr("href")
    var id = getId(url);

    $.get(url, function(serverResponse, status, request){
      $("#cpt-" + id).html(serverResponse).slideDown();
    }).done(function(){
      $(link).removeClass("add-list").addClass('remove-list')
      $(".delete-sub-chapter").removeAttr("data-confirm").removeAttr("data-method")
    })
  }

  var take_list_off = function(link){
    var id = $(link).attr('href').match(/\d+/)[0]
    switchArrow(link);
    $('#cpt-' + id).toggle("fade");
    $(link).removeClass("remove-list").addClass('add-list')
  }



  /******************************************************************
  * When logged in as Creator
  *******************************************************************
  *******************************************************************
  * Pulls in the form to create a chapter 
  *******************************************************************/

  $(document).on("click", '#add-chapter', function(e){
    e.preventDefault();
    var url = $(this).attr("href");
    $.post(url, function(serverResponse, status, request){
      appendChapter(serverResponse)
    })
  });
  
  /*******************************************************************
  * Append new chapter to the list
  ********************************************************************/

  var appendChapter = function(chapter){
    $("#chapter-list").append(
      "<div class='chapter row' id='chapter-" + chapter.id + "'>\
        <h3 class='chapter-title'>Section "+ chapter.number+":</h3> \
        <a class='sub-cpt-list remove-list' href='/chapters/" + chapter.id + "'>\
          <i class='fa fa-arrow-circle-o-up fa-2x'></i>\
        </a>\
        <div class='chapter-edit-icons'>\
          <a class='edit-chapter' data-reveal-id='modal-popup' href='/chapters/" + chapter.id + "/edit'>\
            <i class='fa fa-edit fa-2x'></i>\
          </a>\
          <a class='delete-chapter delete' href='/chapters/" + chapter.id + "' rel='nofollow'>\
            <i class='del-chapter fa fa-trash-o fa-2x'></i>\
          </a>\
        </div>\
      </div>\
      <div class='small-11 small-offset-1' id='cpt-"+ chapter.id + "'>\
      <div id='sub-chapter-list-" + chapter.id + "'></div>\
        <a class='add-sub-chapter' data-reveal-id='modal-popup' href='/chapters/" + chapter.id + "/sub_chapters/new'>\
          Add Sub-section <i class='fa fa-plus-square fa-2x' id='fa-plus-square'></i>\
        </a>\
      </div>");
     removePopup();
  };

  $(document).on("submit", "#modal-popup #new_chapter", function(e){
    e.preventDefault();
    
    var data = $(this).serialize();
    var url = $(this).attr("action");

    if ($('#chapter_title').val() === "") {
      invalidInput("#chapter_title")
    } else {
      $.post(url, data, function(serverResponse, status, request){
        var chapter = serverResponse; 
        appendChapter(chapter);
      }, "json");
    };
  });

  /****************************************************************
  * Edit chapter
  *****************************************************************/

  // get for to popup on click
  $(document).on('click', "#chapter-list .edit-chapter", function(e){
    e.preventDefault()
    var url = $(this).attr('href')

    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse);
      appendX();
    }) 
  })

  // on submit proccess data
  $(document).on('submit',"#modal-popup .edit_chapter", function(e){
    e.preventDefault();
    var url = $(this).attr("action")
    var data = $(this).serialize()

    if ($("#chapter_title").val() == ""){
      invalidInput("#chapter_title");
    } else {
      updateChapter(url, data);
    };
  });

  // method that updates html on page for updated Chapter
  var updateChapter = function(url, data){
    $.post(url, data, function(serverResponse, status, request){
      $('#chapter-' + serverResponse.id + " h3").text("Section " + serverResponse.number+ ": " +serverResponse.title);
    }).done(function(){
      removePopup();
    })
  };

  /********************************************************************
  * Pulls in form to create sub chapter
  *********************************************************************/

  $(document).on("click", '#chapter-list .add-sub-chapter', function(e){
    e.preventDefault();
    var url = $(this).attr("href");
    var id = getId(url);

    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse);
      appendX();
    });
  });

  /********************************************************************
  * Appends subchapter to coresponding list
  *********************************************************************/

  //appending subchapter method
  var appendSubchapter = function(subChapter, chapter){
    $("#sub-chapter-list-" + chapter.id).append(
      "<div class='sub-chapter' id='sub-chapter-" + subChapter.id + "'>\
        <h4><a href='/sub_chapters/" + subChapter.id + "'>" + subChapter.title + "</a></h4>\
        <a class='edit-sub-chapter' data-reveal-id='modal-popup' href='/sub_chapters/" + subChapter.id + "/edit'>\
          <i class='fa fa-edit fa-2x sub-chapter-icon'></i>\
        </a>\
        <a class='delete-sub-chapter' href='/sub_chapters/" + subChapter.id + "'>\
          <i class='fa fa-trash-o fa-2x sub-chapter-icon'></i>\
        </a>\
      </div>"); 

    removePopup();
  }

  // process data and append subchapter
  $(document).on("submit", "#modal-popup #new_sub_chapter", function(e){
    e.preventDefault();
    
    var data = $(this).serialize();
    var url = $(this).attr("action");

    if ($('#sub_chapter_title').val() === "") {
      invalidInput("#sub_chapter_title")
    } else {
      $.post(url, data, function(serverResponse, status, request){
        var subChapter = serverResponse.sub_chapter;
        var chapter = serverResponse.chapter;
        appendSubchapter(subChapter, chapter);
      }, "json");
    };
  });

  /**********************************************************************
  * Edit sub chapter 
  ***********************************************************************/


  $(document).on('click', "#chapter-list .edit-sub-chapter", function(e){
    e.preventDefault()
    var url = $(this).attr('href')

    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse);
      appendX();
    }); 
  })

  $(document).on('submit',"#modal-popup .edit_sub_chapter", function(e){
    e.preventDefault();
    var url = $(this).attr("action")
    var data = $(this).serialize()
    
    if ($('#sub_chapter_title').val() === "") {
      invalidInput("#sub_chapter_title");
    } else {
      updateSubChapter(url, data);
    };
  });

  var updateSubChapter = function(url, data){
    var id = getId(url); 
    $.post(url, data, function(serverResponse, status, request){
      $("#sub-chapter-" + id + " h4 a").text(serverResponse.title)
    }).done(function(){
      removePopup();
    })
  }


  //********************************
  // Deleting chapters 
  // *******************************

  


  $(document).on('click', "#chapter-list .delete-chapter", function(e){
    e.preventDefault();
    var result = window.confirm("Are you sure you want to delete this chapter?")
    if (result){
      var chpUrl = $(this).attr("href")
      var id = getId(chpUrl)
      $('#cpt-' + id).toggle("fade");
      $('#chapter-' + id).toggle('fade',function(){
        $('#chapter-' + id).remove();
        $('#cpt-' + id).remove();

      });
      $.ajax({
        url: chpUrl,
        type: "DELETE",
        success: function(serverResponse){
          $("#chapter-list").html(serverResponse)
        }
      })
    }     
  })

  /********************************
  * Deleting sub-chapters 
  *********************************/

  $(document).on('click', "#chapter-list .delete-sub-chapter", function(e){
    e.preventDefault();
    var result = window.confirm("Are you sure you want to delete this sub-chapter?")
    if (result){
      var subChpUrl = $(this).attr("href")
      var id = getId(subChpUrl)

      $.ajax({
        url: subChpUrl,
        type: "DELETE",
        success: "great:success"
      }, "json").done(function(){
        $('#sub-chapter-' + id).toggle('fade',function(){ $('#sub-chapter-' + id).remove(); });

      })
    }     
  })

  /********************************
  * Editing Tutorial Link
  *********************************/
  
  $(document).on("click", "#edit-tutorial-header", function(e){
    e.preventDefault();
    
    var url = $(this).attr("href");

    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse);
      appendX();
    });
  });

  $(document).on("submit", "#modal-popup .tut-form", function(e){
    e.preventDefault();
    var url = $(this).attr("action");
    var data = $(this).serialize();

    if ($('#tutorial_title').val() === ""){        
      invalidInput("#tutorial_title")
    }else if ($('#tutorial_description').val() === ""){
      invalidInput("#tutorial_description")
    }else{
      updateTutorial(url, data)
    }
  });

  var updateTutorial = function(url, data){
    $.post(url, data, function(serverResponse, status, request){
      $(".tutorial-header h1").text(serverResponse.title);
      $(".tutorial-header p").text("Description: " + serverResponse.description)
    }, "json").done(function(){
      removePopup();
    })
  }
})