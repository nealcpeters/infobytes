class CommunitiesController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :edit, :delete, :create_user_membership]

	def index
		@communities = Community.all.order('updated_at DESC')
	end

	def show
		 @community = Community.find(params[:id])
		 @tutorials = Tutorial.where(community_id: params[:id])
	end

	def new
		@community = Community.new
		render partial: "communities/community_form" if request.xhr?
	end

	def create
		@community = Community.new(community_params)
		current_user.communities << @community
		if @community.save
			if request.xhr?
				render json: @community
			else
				flash[:notice]="Your community has been created"
				redirect_to communities_path
			end
		else
			# it makes it into here, but still appends the unsaved object instead of displaying form with errors
			if request.xhr?
				x = {no: "no"}
				render json: x
			else
				@errors = @community.errors.messages
				render "new"
			end
		end
	end

	def create_user_membership
		current_user.communities << Community.find(params[:id])
		redirect_to community_path(params[:id])
	end

	def delete_user_membership
		current_user.communities.destroy(params[:id])
		if request.xhr?

		else
		redirect_to user_path(current_user)
	end

	end

	protected

	def community_params
		params.require(:community).permit(:name, :description)
	end

end