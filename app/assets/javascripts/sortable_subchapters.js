$(function() {
 
    $( ".sortable-list").sortable({
      handle: ".drag-bar",
      placeholder: "list-placeholder",
      axis: "y",
      connectWith: ".sortable-list" 
    });
    $(".sortable-list").disableSelection();

    $(".sortable-list").on("sortupdate", function(){
        var lists = []
        $(".sortable-list").each(function(index, ul){
           var id = $(this).attr("id").match(/\d+/)[0]
           var list = new List(id)
           var children = $(ul).children(".ui-state-default");
           list.populateList(children);
           lists.push(list)
        })

        $.post('/chapters/update_sub_chapters', {data: lists}, function(serverResponse){
          console.log(serverResponse)
        })
      })
  });

  var List = function(id){
    this.id = id;
    var contents = {};
    this.container = contents;

    var addItem = function(item){
      contents.push(item);
    };

    this.populateList = function(list){
      $(list).each(function(index, li){
        var liId = $(li).attr("id").match(/\d+/)
        var item = new Item(index + 1)
        contents[liId] = item
      })
    };

  }

  var Item = function( theOrder){
    this.number = theOrder;
  }