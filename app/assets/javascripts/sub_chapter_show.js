$(function(){
  $(document).foundation(); 
  /*******************************************************************
  * Helper methods
  ********************************************************************/

  var invalidInput = function(field){
    $(field).css("border-color", "red")
  };

  // Appends an x to popup window #modal-popup
  var appendX = function(){
    $("#modal-popup").append("<a class='close-reveal-modal '>&#215;</a>")
  };

  // Return id from url
  var getId = function(url){
    return url.match(/\d+/)[0]
  };

  // Removes modal popup of the screen
  var removePopup = function(){
    $("#modal-popup").foundation("reveal", "close");
  };

  var populatePopup = function(content){
    $("#modal-popup").html(content);
    appendX();
  };

  /*****************************************************************
  * Edit paragraph
  ******************************************************************/

  $(document).on('click', 'body .edit-paragraph', function(e){
    e.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse);
      appendX();
    })
  })

  $(document).on('submit', "#modal-popup .edit_paragraph", function(e){
    e.preventDefault();
    var string = $("#editable-div").html();
    var url = $(this).attr("action")
    var data = {paragraph: {body: string}}
    updateParagraph(url, data)
  })

  var updateParagraph = function(url, data){
    $.ajax({
      url: url,
      data: data,
      method: "PATCH", 
      success: function(serverResponse, status, request){
        var id = serverResponse.id
        var body = serverResponse.body
        $('#paragraph-' + id ).replaceWith("<div id='paragraph-" + id+ "'class='paragraph-container'>" + body + "</div></div>");
        removePopup();
      }
    })
  }
  
  

  /*************************************************
  * testing stuff
  **************************************************/

  $('.content-item').on("dblclick", function(e){
    var currentDiv = e.currentTarget;
  })

  /* ***************************************
  *  Get requests for media
  ** ***************************************/
  $(document).on("click", "#add-text a", function(e){
    e.preventDefault();
    
    var url = $(this).attr("href");
    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse)
    });
  });

  $(document).on("click", "#add-code a",function(e){
    e.preventDefault();
    
    var url = $(this).attr("href");
    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse)
    });
  });

  $(document).on("click", "#add-image a", function(e){
    e.preventDefault();
    
    var url = $(this).attr("href");
    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse)
    });
  });

  /* ***************************************
  *  Post requests for media   
  ** ***************************************/

  var appendParagraph = function(paragraph, content){
    $("#content-body .sortable-contents").append(
      "<li class='ui-state-default' id='" + content.id +"'>\
        <i class='fa fa-minus fa-2x drag-content'></i>\
        <div class='content-item' id='content-item-" + content.id + "'>\
          <div id='paragraph-" + paragraph.id + "'>\
            <div class='paragraph-container'>" + paragraph.body + "</div>\
          </div>\
          <div class='edit-links'>\
            <div>\
              <a class='edit-paragraph' data-reveal-id='modal-popup' href='/paragraphs/" + paragraph.id + "/edit'>\
                <i class='fa fa-edit fa-2x'></i><br>edit\
              </a>\
            </div>\
            <div>\
            <a data-confirm='Are you sure you want to remove this paragraph?' data-method='delete' href='/paragraphs/" + paragraph.id + "' rel='nofollow'>\
              <i class='fa fa-trash-o fa-2x'></i><br>delete\
              </a>\
            </div>\
          </div>\
        </div>\
      </li>")

  }

  var appendSnippet = function(snippet, content){
    $("#content-item-" + content.id).html(
      "<div id='editor-" + snippet.id + "' style='height: 200px; width: 100%; background-color:#eee'>" + snippet.body + "</div>\
      <input type='hidden' id ='editor_language-" + snippet.id + "' value='" + snippet.language + "'>\
      <div class='edit-links'>\
        <div>\
          <a class='edit-snippet' data-reveal-id='modal-popup' href='/code_snippets/" + snippet.id + "/edit'><i class='fa fa-edit fa-2x'></i><br>edit</a>\
        </div>\
        <div>\
          <a data-confirm='Are you sure you want to remove this code snippet?' data-method='delete' href='/code_snippets/" + snippet.id + "' rel='nofollow'><i class='fa fa-trash-o fa-2x'></i><br>delete</a>\
        </div>\
      </div>\
      <script>\
        var editor = ace.edit('editor-" + snippet.id + "');\
        var language = document.getElementById('editor_language-" + snippet.id + "').value;\
        editor.setTheme('ace/theme/textmate');\
        editor.session.setMode('ace/mode/" + snippet.language + "');\
        editor.getSession().setUseWrapMode(true);\
        editor.setReadOnly(true);\
        editor.setOptions({maxLines: 25,\
            minLines: 4,});\
      <\/script>"
  )}

  $(document).on("submit", "#modal-popup #new_paragraph", function(e){
    e.preventDefault();

    var data = $(this).serialize();
    var url = $(this).attr("action");

    $.post(url, data, function(serverResponse, status, request){
      appendParagraph(serverResponse.paragraph, serverResponse.content)

      $("#modal-popup").foundation("reveal", "close");
    }, "json");
  });
  
  $(document).on("submit", "#modal-popup #new_code_snippet", function(e){
    e.preventDefault();

    var data = $(this).serialize();
    var url = $(this).attr("action");

    $.post(url, data, function(serverResponse, status, request){
      $(".sortable-contents").append(
        "<li class='ui-state-default' id='" + serverResponse.content.id +"'>\
        <i class='fa fa-minus fa-2x drag-content'></i>\
        <div class='content-item' id='content-item-" + serverResponse.content.id + "'></div></li>")
      appendSnippet(serverResponse.snippet, serverResponse.content)

      $("#modal-popup").foundation("reveal", "close");
    }, "json");
  });


  /*****************************************************************
  * Edit snippet
  ******************************************************************/
  $(document).on('click', '#content-body .edit-snippet', function(e){
    e.preventDefault();
    var url = $(this).attr("href");
    $.get(url, function(serverResponse, status, request){
      $("#modal-popup").html(serverResponse);
      appendX();
    })
  })


  $(document).on('submit', "#modal-popup .edit_code_snippet", function(e){
    e.preventDefault();
    var url = $(this).attr("action")
    var data = $(this).serialize()

    $.post(url, data, function(serverResponse, status, request){
      var content = serverResponse.content;
      var snippet = serverResponse.snippet;
      appendSnippet(snippet,content); //function defined 
    }, "json").done(function(){
      removePopup();
    })
  })

  /*****************************************************
   * Deleting contents
  /*****************************************************/
  
  
  $(document).on('click', "#content-body .delete-content", function(e){
    e.preventDefault();
    var url = $(this).attr("href");
    var contentElement = $(this).closest(".ui-state-default");
    var result = window.confirm("Are you sure you want to delete this part?")
    if (result){
      $.ajax({
        url: url,
        type: "DELETE",
        success: "great:success"
      }, "json").done(function(){
        $(contentElement).toggle("fade", function(){ $(contentElement).remove() })
      })
    }
  })


  /************************************************************
  *  Comments ajax
  *************************************************************/
  
  $(document).on("click", ".bring-comments", function(e){
    e.preventDefault();
    var url = $(this).attr("href")
    var contentId = getId(url);

    $.get(url, function(serverResponse, status, request){
      $("#content-item-" + contentId + " .comments-container").html(serverResponse). fadeIn()
      $("#content-item-" + contentId + " .comments-container").prepend("<a class='close-comments' href='#" + contentId + "'>&#215;</a>")
    })
  })


  $(document).on("submit", "#new_comment", function(e){
    e.preventDefault();
    var url = $(this).attr("action");
    var contentId = getId(url);
    var data = $(this).serialize();
    $.post(url, data, function(serverResponse, status, request){
      var user = serverResponse.user;
      var comment = serverResponse.comment;
      var content = serverResponse.content;
      $("#content-item-" + contentId + " .comments-container").html(serverResponse)
      $("#content-item-" + contentId + " .comments-container").prepend("<a class='close-comments' href='#" + contentId + "'>&#215;</a>")
    })
  })

  $(document).on("click", ".close-comments", function(e){
    e.preventDefault();
    id = getId($(this).attr('href'))
    $("#content-item-" + id + " .comments-container").toggle("fade", function(){
      $(this).empty();
    })
  })

  // var postComment = function(comment,content,user){
  //   var userLink;
  //   if(user){
  //     userLink = "<p>By: <a href='/users/" + user.id + "'>" + user.user_name + "</a></p>"
  //   }else{
  //     userLink = "<p>By: Guest At: " +comment.created_at.substring(0, ) + "</p>";
  //   }
  //   $("#comments-for-content-" + content.id).prepend(
  //     "<div class='comment-" + comment.id + "'><p>" + comment.body + "</p>" + userLink + "</div>"
  //     )
  // }







  // $("#imagePopup").on("submit", "#new_image", function(e){
  //   e.preventDefault();

  //   var data = $(this).serialize();
  //   var img = $("#image_image_path").val();
  //   var url = $(this).attr("action");

  //   consol.log(data+'&r='+encodeURIComponent(img))

  //   $.post(url, data+'&r='+encodeURIComponent(img), function(serverResponse, status, request){
  //     var image = serverResponse;
      
  //     $("#content-body").append("<div class='image-container>").slideDown();
  //     $("#imagePopup").foundation("reveal", "close");
  //   }, "json");
  // });

})
