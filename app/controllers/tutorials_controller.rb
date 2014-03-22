class TutorialsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new]
  before_filter :authenticate_tutorial_owner, only: [:edit, :delete, :update]

  def show
    @tutorial = Tutorial.find(params[:id])
    @chapter = Chapter.new
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = current_user.tutorials.new(tutorial_params)
    if @tutorial.save
      flash[:notice]="Your new tutorial has been created!"
      redirect_to @tutorial
    else
      @errors = @tutorial.errors.messages
      render "new"
    end
  end

  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def update  
    @tutorial = Tutorial.find(params[:id])
    @tutorial.update(tutorial_params)
    if @tutorial.save
      redirect_to @tutorial
    else
      @errors = @tutorial.errors.messages
      render "edit"
    end
  end

  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy
    redirect_to current_user
  end

  def index
    @tutorials = Tutorial.all
  end

  protected

  def tutorial_params
    params.require(:tutorial).permit(:title, :description)
  end

  def authenticate_tutorial_owner
    if !(user_signed_in? && current_user.id == Tutorial.find(params[:id]).user.id)
      flash[:warning] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end
end