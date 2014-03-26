$(function(){
	$(window).scroll(function() {
	  var $bar = $("#marker")
	  var window_offset = $bar.offset().top - $(this).scrollTop();

	  if (window_offset < 0) {

	  	$("#toc-bar").slideDown(200);
	  } else {
	  	$("#toc-bar").slideUp(200);
	  	$(".chapter-list").slideUp(200);
	  	$("#toc-link").data("status", "hidden")
	  }
	});

	$("#toc-link").on("click", function(e){
	  e.preventDefault();
	  
	  if ($(this).data("status") === "hidden") {
	  	$(this).data("status", "shown")
	    $(".chapter-list").slideDown(200);
	  } else if ($(this).data("status") === "shown") {
	  	$(this).data("status", "hidden")
	    // $(".chapter-list").slideUp(200);
	  }
	});

	$(".sidebar-link").on("click", function(){
		$("#toc-link").data("status", "hidden")
	  $(".chapter-list").slideUp(200);
	})

	$("#close-toc").on("click", function(e){
	  e.preventDefault();
	  
	  $("#toc-link").data("status", "hidden")
	  $(".chapter-list").slideUp(200);
	});
});