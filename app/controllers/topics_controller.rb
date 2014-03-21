class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
		@subtopics = Subtopic.where(topic_id: @topic)
	end

end