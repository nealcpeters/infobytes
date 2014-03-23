class UsersController < ApplicationController
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
  
end