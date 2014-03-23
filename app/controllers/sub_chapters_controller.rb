class SubChaptersController < ApplicationController
  before_filter :authenticate_sub_chapter_owner_create, only: [:new, :create]
  before_filter :authenticate_sub_chapter_owner_update, only: [:edit, :update, :destroy]

  def new
    @chapter = Chapter.find(params[:chapter_id])
    @sub_chapter = SubChapter.new

    render partial: "sub_chapters/form_new" if request.xhr?
  end

  def create
    @chapter = Chapter.find(params[:chapter_id])
    @sub_chapter = @chapter.sub_chapters.new(sub_chapter_params.merge(number: (@chapter.sub_chapters.count + 1)))

    if @sub_chapter.save

      if request.xhr?
        render json: {sub_chapter: @sub_chapter, chapter: @sub_chapter.chapter}
      else     
        flash[:notice]= "Subchapter created succesfully"
        redirect_to @sub_chapter
      end

    else
      @errors = @subchapter.errors.messages
      render 'new'
    end
  end

  def show
    @sub_chapter = SubChapter.find(params[:id])
    @contents = @sub_chapter.contents.order(:order_number)

    render "sub_chapters/show", layout: false if request.xhr?
  end

  def edit 
    @sub_chapter = SubChapter.find(params[:id])
    @chapter = @sub_chapter.chapter
    render partial: "sub_chapters/form_edit" if request.xhr?
  end


  def update
    @sub_chapter = SubChapter.find(params[:id])
    @sub_chapter.update(sub_chapter_params)
    if @sub_chapter.save
      flash[:notice] = "Subchapter updated succesfully"
      
      if request.xhr?
        render json: @sub_chapter
      else    
        redirect_to @sub_chapter
      end
    else
      @errors = @subchapter.errors.messages
      render 'edit'
    end
  end

  def destroy
    @sub_chapter = SubChapter.find(params[:id])
    @sub_chapter.destroy
    flash[:notice] = "Subchapter removed"
    if request.xhr?
      render json: {result: "success", chapter: @sub_chapter} 
    else
      redirect_to @sub_chapter.chapter
    end
  end

  protected

  def sub_chapter_params
    params.require(:sub_chapter).permit(:title)
  end

  def authenticate_sub_chapter_owner_create
    if !(user_signed_in? && current_user == Chapter.find(params[:chapter_id]).tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end

  def authenticate_sub_chapter_owner_update
    if !(user_signed_in? && current_user == SubChapter.find(params[:id]).chapter.tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end