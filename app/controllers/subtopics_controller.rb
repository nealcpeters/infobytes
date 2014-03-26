class SubtopicsController < ApplicationController
	def show
		@subtopic = Subtopic.find(params[:id])
		@tutorials = @subtopic.tutorials.paginate(page: params[:page], per_page: 10)
	end
	
end