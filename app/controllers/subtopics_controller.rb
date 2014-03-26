class SubtopicsController < ApplicationController
	def show
		@tutorials = Tutorial.where(subtopic_id: params[:id]).paginate(page: params[:page], per_page: 10)
	end
	
end