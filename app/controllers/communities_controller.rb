class CommunitiesController < ApplicationController

	def index
		@communities = Community.all
	end

	def show
		 @community = Community.find(params[:id])
		 @tutorials = Tutorial.where(community_id: params[:id])
	end

end