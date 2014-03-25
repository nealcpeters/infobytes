class RatingsController < ApplicationController 
  before_filter :authenticate_user!

  def update_rating
    tutorial = Tutorial.find(params[:tutorial_id])
    
    if request.xhr?
	    if user_voted?(tutorial)
	      render json: {already_voted: true}
	    else
        render json: {already_voted: false}
        Rating.create(user_id: current_user.id,
	                    tutorial_id: tutorial.id,
	                    score: params[:rating])
	    end
	  else
	  	if user_voted?(tutorial)
	  		flash[:notice] = "You have already voted this tutorial."
	  	else
	  		flash[:notice] = "Thanks for voting!"
			  Rating.create(user_id: current_user.id,
		                  tutorial_id: tutorial.id,
		                  score: params[:rating])
			end
		  redirect_to tutorial
	  end
	end

	def update_rating_ajax
    tutorial = Tutorial.find(params[:id])
    render json: {rating: rating(tutorial), id: tutorial.id}
	end

	private

  def rating(tutorial)
    total_votes = tutorial.ratings.count
    if total_votes == 0
    	0
    else
	    total_count = tutorial.ratings.sum(:score)
	    (total_count / total_votes.to_f).round
	  end
  end

	def user_voted?(tutorial)
    !tutorial.ratings.where(user_id: current_user.id).empty?
	end
end