class CodeSnippits < ApplicationController
  before_filter :authenticate_code_snippit_owner_create, only: [:new, :create]
  before_filter :authenticate_code_snippit_owner_update, only: [:edit, :update, :destroy]
  
  def new
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @code_snippit = CodeSnippit.new
  end

  def edit
    @code_snippit = CodeSnippit.find(params[:id])
  end

  def update
    @code_snippit = CodeSnippit.find(params[:id])
    @code_snippit.update(code_snippit_params)
    if @code_snippit.save
      @code_snippit.content = Content.create(sub_chapter_id: params[:sub_chapter_id], order_number: (@sub_chapter.contents.count + 1))
      flash[:notice]="Your code_snippit has been updated!"
      redirect_to @sub_chapter
    else
      @errors = @code_snippit.errors.messages
      render "new"
    end
  end

  def create
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @code_snippit = CodeSnippit.new(code_snippit_params)
    if @code_snippit.save
      @code_snippit.content = Content.create(sub_chapter_id: params[:sub_chapter_id], order_number: (@sub_chapter.contents.count + 1))
      flash[:notice]="Your new code_snippit has been added!"
      redirect_to @sub_chapter
    else
      @errors = @code_snippit.errors.messages
      render "new"
    end
  end

  protected

  def code_snippit_params
    params.require(:code_snippit).permit(:body)
  end

  def authenticate_code_snippit_owner_create
    if !(user_signed_in? && current_user == SubChapter.find(params[:sub_chapter_id]).chapter.tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end

  def authenticate_code_snippit_owner_update
    if !(user_signed_in? && current_user == CodeSnippit.find(params[:id]).content.sub_chapter.chapter.tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end 