class SubtopicsController < ApplicationController
	def show
		@subtopic = Subtopic.find(params[:id])
	end
	
end