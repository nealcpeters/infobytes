module TutorialsHelper
  
  def tutorial_creator?
    user_signed_in? && current_user == Tutorial.find(params[:id]).user
  end

  def under_score(title)
    title.gsub(" ", "_")
  end

  def rating(tutorial)
    total_votes = tutorial.ratings.count
    if total_votes == 0
    	0
    else
	    total_count = tutorial.ratings.sum(:score)
	    (total_count / total_votes.to_f).round
	  end
  end

end