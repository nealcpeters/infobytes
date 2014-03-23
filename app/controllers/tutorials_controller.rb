class TutorialsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new]
  before_filter :authenticate_tutorial_owner, only: [:edit, :delete, :update]

  def show
    @tutorial = Tutorial.find(params[:id])
    @chapter = Chapter.new
    @chapters = @tutorial.chapters.order(:number)
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
    render partial: "tutorials/tutorial_form" if request.xhr?
  end

  def update  
    @tutorial = Tutorial.find(params[:id])
    @tutorial.update(tutorial_params)
    if @tutorial.save
      
      if request.xhr?
        render json: @tutorial
      else
        flash[:notice] = "Tutorial updated."
        redirect_to @tutorial
      end
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

  def pdf_view
    @tutorial = Tutorial.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = TutorialPdf.new(@tutorial)
        send_data pdf.render, filename: "#{@tutorial.title}.pdf", type: "application/pdf"
      end
    end
  end

  def html_view
    @tutorial = Tutorial.find(params[:id])
    @author = @tutorial.user
    @chapters = @tutorial.chapters
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