class TutorialsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new, :update_rating]
  before_filter :authenticate_tutorial_owner, only: [:edit, :delete, :update]

  def show
    @tutorial = Tutorial.find(params[:id])
    @chapter = Chapter.new
    @author = @tutorial.user
    @chapters = @tutorial.chapters.order(:number)
    if @tutorial.community_id 
      @community = Community.find(@tutorial.community_id)
    end
  end

  def new
    @tutorial = Tutorial.new
    render partial: "tutorials/tutorial_new" if request.xhr?
  end

  def create
    @tutorial = current_user.tutorials.new(tutorial_params)
    if @tutorial.save
      # @tutorial.chapters.create(title: "Section 1");
      # @tutorial.chapters.first.sub_chapters.create(title: "Sub-section 1")
      flash[:notice]="Your new tutorial has been created!"
      redirect_to @tutorial
    else
      @errors = @tutorial.errors.messages
      render "new"
    end
  end

  def edit
    @tutorial = Tutorial.find(params[:id])
    render partial: "tutorials/tutorial_edit" if request.xhr?
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
    @tutorials = Tutorial.paginate(page: params[:page], per_page: 10)
  end

  def html_view
    @tutorial = Tutorial.find(params[:id])
    @author = @tutorial.user
    @chapters = @tutorial.chapters.order(:number)
  end

  def search 
    @search_content = params[:search_data]
    @tutorials = Tutorial.where("title ILIKE ? OR description ILIKE ?", "%#{@search_content}%", "%#{@search_content}%")
  end

  def add_community
    @tutorial = Tutorial.find(params[:id])
    @tutorial.update(tutorial_params)
    @community = Community.find(@tutorial.community_id)

    if @tutorial.save
      @email = UserMailer.new_tutorial_email(@tutorial, @community)
      p @email
      p @email
      p @email
      p @email
      UserMailer.new_tutorial_email(@tutorial, @community).deliver
      if request.xhr?
        render json: @community
        flash[:notice] = "Tutorial added to community."
      else
        redirect_to @tutorial
      end
    end

#     respond_to do |format|
#       if @tutorial.save
#         # Tell the UserMailer to send a welcome Email after save
#         UserMailer.new_tutorial_email(@tutorial, @community).deliver
#  
#         format.html { redirect_to(@tutorial, notice: 'Tutorial was successfully updated.') }
#         format.json { render json: @user, status: :created, location: @user }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end

  end

  protected
  
  def tutorial_params
    params.require(:tutorial).permit(:title, :description, :community_id)
  end

  def authenticate_tutorial_owner
    if !(user_signed_in? && current_user.id == Tutorial.find(params[:id]).user.id)
      flash[:warning] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end
end