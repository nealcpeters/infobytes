class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
    # CODE REVIEW: why not @topic.subtopics?
		@subtopics = Subtopic.where(topic_id: @topic)
	end

end