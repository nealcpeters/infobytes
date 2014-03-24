class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
		@subtopics = Subtopic.paginate(page: params[:page], per_page: 10).where(topic_id: @topic)
	end

end