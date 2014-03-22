class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tutorials = Tutorial.where(user_id: @user.id)
  end
end