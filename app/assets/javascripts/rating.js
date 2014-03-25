
$(function(){
  var updateRating = function(id){
    $.post('/ratings/update/' + id, function(serverResponse, status, request){
      var stars = serverResponse.rating;
      var id = serverResponse.id
      
      $("#star-list-" + id).children().each(function(index){
        if (stars >= index) {
        	$(this).attr("class", "star")
        } else {
        	$(this).attr("class", "empty-star")
        }
      });
    }, "json");
  };

  $(".fa-star").on("click", function(e){
  	e.preventDefault();

    var url = $(this).closest("a").attr("href");
    var tutorialId = url.split('/')[2];
  	var rating = parseInt($(this).closest('li').attr('class').split(" ")[0]);
    
    $.get(url, function(serverResponse, status, request){
      var voted = serverResponse.already_voted
      console.log(status)

      
      if (voted === true) {
      	$("#message-" + tutorialId).html("You have already voted on this tutorial.").css("color", "#944d08");
      } else if (voted === false) {
      	$("#message-" + tutorialId).html("Thank you for voting.").css("color", "green");
      }	
     
    }, "json").done(function(){
    	updateRating(tutorialId);
    }).fail(function() {
      $("#message-" + tutorialId).html("Please log in to vote").css("color", "#944d08");
    });
  });
});
