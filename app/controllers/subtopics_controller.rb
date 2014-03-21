class SubtopicsController < ApplicationController
	def show
		@tutorials = Tutorial.where(subtopic_id: params[:id])
	end
	
end