class SubtopicsController < ApplicationController
	def show
		@subtopic = Subtopic.find(params[:id])
		@tutorials = @subtopic.tutorials
	end
	
end