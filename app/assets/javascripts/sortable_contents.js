$(function(){
  $(document).foundation();
  $(".sortable-contents").sortable({
    // handle: ".drag-content",
    placeholder: "content-placeholder",
    axis: "y"
  });
  $(".sortable-contents").disableSelection();

  $(".sortable-contents").on("sortupdate",function(){
    var container = {}
    var list = $(this).children()
    $(list).each(function(index, item){
      var id = $(item).attr("id")
      container[id] = index + 1;
    })
    var url = "/contents/update_order"
    $.post(url, {data: container}, function(serverResponse){}) 
  })

  $(".delete-content").removeAttr("data-confirm").removeAttr("data-method")
})