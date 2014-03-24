class RatingsController < ApplicationController 
  before_filter :authenticate_user!

  def update_rating
    tutorial = Tutorial.find(params[:tutorial_id])
	  Rating.create(user_id: current_user.id,
                  tutorial_id: tutorial.id,
                  score: params[:rating])
    redirect_to tutorial
	end
end