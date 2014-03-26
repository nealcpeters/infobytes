$(document).function(){
	$(".tut-form").on("submit", function(e){
		e.preventDefault();

		var title = $("#tutorial_title").val();
		var desc = $("#tutorial_description").val();
	  console.log(title)
	  console.log(desc)

	  if (title != "" && desc != "") {
	    $(this).unbind("submit").submit();
	    console.log("submit")

	  } else if (title === "" && desc === "") {
	  	$("#tutorial_title").css("border-color", "red");
	  	$("#tutorial_description").css("border-color", "red");
	  	$("#js-errors p").html("Requires Title and Description");

	  } else if (title === "") {
	  	$("#tutorial_title").css("border-color", "red");
	  	$("#js-errors p").html("Requires Title");

	  } else if (desc === ""){
	  	$("#tutorial_description").css("border-color", "red");
	  	$("#js-errors p").html("Requires Description");
	  }
	});
};