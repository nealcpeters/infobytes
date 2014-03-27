class ChaptersController < ApplicationController
  before_filter :authenticate_tutorial_owner_create, only: [:create, :new]
  before_filter :authenticate_tutorial_owner, only: [:edit, :delete, :update]

	def new
    @tutorial = Tutorial.find(params[:tutorial_id])
    @chapter = Chapter.new
    render partial: "chapters/form" if request.xhr?
	end 

	def create
    @tutorial = Tutorial.find(params[:tutorial_id])

    @chapter = @tutorial.chapters.new(chapter_params.merge(number: @tutorial.chapters.count + 1))
    
    if @chapter.save
      respond_to do |format|
        format.json { render :json => @chapter }
        format.html {
          flash[:notice] = "Chapter #{@chapter.number}: #{@chapter.title} added."
          redirect_to @chapter  
          }
      end
    else
      @errors = @chapter.errors.messages
      render 'new'
    end
	end

	def edit
    @chapter = Chapter.find(params[:id])
    @tutorial = @chapter.tutorial
    render partial: "chapters/edit_form" if request.xhr?
	end

	def update
		@chapter = Chapter.find(params[:id])
    @chapter.update_attributes(chapter_params)

    if @chapter.save
      flash[:notice] = "Chapter Updated"
      if request.xhr?
        render json: @chapter 
      else
        redirect_to @chapter
      end
    else
      @errors = @chapter.errors.messages
      render 'edit'
    end
	end

	def show
    @chapter = Chapter.find(params[:id])
    @sub_chapters = @chapter.sub_chapters.order(:number)
    render partial: "chapters/sub_chapters" if request.xhr?
	end

	def destroy
    @chapter = Chapter.find(params[:id])
    flash[:notice] = "Chapter Removed"
    @chapter.destroy
    @chapter.tutorial.update_chapter_order
    @tutorial = Tutorial.find(@chapter.tutorial_id)
    
    puts @tutorial.chapter_ids
    @chapters = @tutorial.chapters.order(:number)
    if request.xhr?
      render partial: "tutorials/chapter_tree"
    else
      redirect_to @tutorial
    end
	end

  def update_sub_chapters
    params[:data].length.times do |index|
      list = params[:data][index.to_s]
      chapter_id = list[:id]
      if list[:container]
        list[:container].each do |id, order|
          sub_chapter = SubChapter.find(id)
          sub_chapter.update_data(chapter_id, order[:number])
        end
      end
    end

    if request.xhr?
      render json: {"message"=> "great success"} 
    else
      redirect_to "/"
    end
  end

  def generate
    @tutorial = Tutorial.find(params[:tutorial_id])
    @chapter = @tutorial.chapters.new(number: @tutorial.chapters.count + 1)
    @chapter.save
    if request.xhr?
      @chapters = @tutorial.chapters
      render partial: "tutorials/chapter_tree"
    else
      redirect_to @tutorial
    end

  end

	private

	def chapter_params
    params.require(:chapter).permit(:title)
	end

	def authenticate_tutorial_owner_create
    if !(user_signed_in? && current_user.id == Tutorial.find(params[:tutorial_id]).user.id)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
	end

	def authenticate_tutorial_owner
    if !(user_signed_in? && current_user.id == Chapter.find(params[:id]).tutorial.user.id)
    	flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
	end
end