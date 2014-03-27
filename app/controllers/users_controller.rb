class UsersController < ApplicationController
  before_filter :profile_owner, only: [:update_information]

  def show
    @user = User.find(params[:id])
    @tutorials = Tutorial.where(user_id: @user.id)
  end

  def sign_in
    @user = User.new
    render partial: "devise/sessions/form"
  end

  def sign_up
    render partial: "devise/registrations/form_new"
  end

  def update_information
    @user = User.find(params[:id])
    @user.update_attributes(update_params)
    flash[:notice] = "User information updated."
    redirect_to @user
  end
  
  private

  def update_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end

  def profile_owner 
    user_signed_in? && current_user.id == params[:id]
  end
end