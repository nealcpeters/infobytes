class TutorialsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new, :edit, :delete, :update]

  def show
    @tutorial = Tutorial.find(params[:id])
    @chapter = Chapter.new
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    p current_user
    @tutorial = current_user.tutorials.new(topic_params)
    if @tutorial.save
      flash[:notice]="Your new tutorial has been created!"
      redirect_to @tutorial
    else
      @errors = @tutorial.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update  
  end

  def delete
  end

  protected

  def topic_params
    params.require(:tutorial).permit(:title, :description)
  end
end