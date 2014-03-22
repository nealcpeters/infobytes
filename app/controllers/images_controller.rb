class ImagesController < ApplicationController
  before_filter :authenticate_image_owner_create, only: [:new, :create]
  before_filter :authenticate_image_owner_update, only: [:edit, :update, :destroy]
  
  def new
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @image = Image.new
    render partial: "images/form_new" if request.xhr?
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update(code_snippit_params)
    @sub_chapter = @image.content.sub_chapter

    if @image.save
      flash[:notice]="Your image has been updated!"
      redirect_to @sub_chapter
    else
      @errors = @image.errors.messages
      render "new"
    end
  end

  def create
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @image = Image.new(code_snippit_params)

    if @image.save
      @image.content = Content.create(sub_chapter_id: params[:sub_chapter_id], order_number: (@sub_chapter.contents.count + 1))

      if request.xhr?
        render json: @image
      else
        flash[:notice]="Your new image has been added!"
        redirect_to @sub_chapter
      end
    else
      @errors = @image.errors.messages
      render "new"
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  protected

  def code_snippit_params
    params.require(:image).permit(:image_path)
  end

  def authenticate_image_owner_create
    if !(user_signed_in? && current_user == SubChapter.find(params[:sub_chapter_id]).chapter.tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end

  def authenticate_image_owner_update
    if !(user_signed_in? && current_user == Image.find(params[:id]).content.sub_chapter.chapter.tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end