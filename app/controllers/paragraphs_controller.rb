class ParagraphsController < ApplicationController
  before_filter :authenticate_paragraph_owner_create, only: [:new, :create]
  before_filter :authenticate_paragraph_owner_update, only: [:edit, :update, :destroy]
  
  def new
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @paragraph = Paragraph.new
    render partial: "paragraphs/form_new" if request.xhr?
  end

  def edit
    @paragraph = Paragraph.find(params[:id])

    render partial: "paragraphs/form_update" if request.xhr?
  end

  def update
    @paragraph = Paragraph.find(params[:id])
    @paragraph.update(paragraph_params)
    @sub_chapter = @paragraph.content.sub_chapter
    
    if @paragraph.save

      if request.xhr?
        render json: @paragraph
      else
        flash[:notice]="Your paragraph has been updated!"
        redirect_to @sub_chapter
      end
    else
      @errors = @paragraph.errors.messages
      render "new"
    end
  end

  def create
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @paragraph = Paragraph.new(paragraph_params)

    if @paragraph.save
      Content.create(sub_chapter_id: params[:sub_chapter_id], order_number: (@sub_chapter.contents.count + 1),attachable_id: @paragraph.id, attachable_type: "Paragraph")
      
      if request.xhr?
        render json: @paragraph
      else
        flash[:notice]="Your new paragraph has been added!"
        redirect_to @sub_chapter
      end
    else
      @errors = @paragraph.errors.messages
      render "new"
    end
  end

  def destroy
    @paragraph = Paragraph.find(params[:id])
    flash[:notice] = "Paragraph has been removed"
    @paragraph.destroy
    if request.xhr?
      render json: {result: "success"}
    else
      redirect_to @paragraph.content.sub_chapter
    end
  end

  protected

  def paragraph_params
    params.require(:paragraph).permit(:body)
  end

  def authenticate_paragraph_owner_create
    if !(user_signed_in? && current_user == SubChapter.find(params[:sub_chapter_id]).chapter.tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end

  def authenticate_paragraph_owner_update
    if !(user_signed_in? && current_user == Paragraph.find(params[:id]).content.sub_chapter.chapter.tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end