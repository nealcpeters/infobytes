class CodeSnippetsController < ApplicationController
  before_filter :authenticate_code_snippet_owner_create, only: [:new, :create]
  before_filter :authenticate_code_snippet_owner_update, only: [:edit, :update, :destroy]
  
  def new
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @code_snippet = CodeSnippet.new
    render partial: "code_snippets/form_new" if request.xhr?
  end

  def edit
    @code_snippet = CodeSnippet.find(params[:id])
  end

  def update
    @code_snippet = CodeSnippet.find(params[:id])
    @code_snippet.update(code_snippit_params)
    @sub_chapter = @code_snippet.content.sub_chapter
    if @code_snippet.save
      flash[:notice]="Your code_snippit has been updated!"
      redirect_to @sub_chapter
    else
      @errors = @code_snippet.errors.messages
      render "new"
    end
  end

  def create
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @code_snippet = CodeSnippet.new(code_snippit_params)

    if @code_snippet.save
      Content.create(sub_chapter_id: params[:sub_chapter_id], order_number: (@sub_chapter.contents.count + 1), attachable_id: @code_snippet.id, attachable_type: "CodeSnippet")

      if request.xhr?
        render json: @code_snippet
      else
        flash[:notice]="Your new code_snippit has been added!"
        redirect_to @sub_chapter
      end
    else
      @errors = @code_snippet.errors.messages
      render "new"
    end
  end

  def show
    @code_snippet = CodeSnippet.find(params[:id])
  end

  def destroy
    @code_snippet = CodeSnippet.find(params[:id])
    flash[:notice] = "Code Snippet has been removed"
    @code_snippet.destroy
    if request.xhr?
      render json: {result: "success"}
    else
      redirect_to @code_snippet.content.sub_chapter
    end
  end


  protected

  def code_snippit_params
    params.require(:code_snippet).permit(:body, :language)
  end

  def authenticate_code_snippet_owner_create
    if !(user_signed_in? && current_user == SubChapter.find(params[:sub_chapter_id]).chapter.tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end

  def authenticate_code_snippet_owner_update
    if !(user_signed_in? && current_user == CodeSnippet.find(params[:id]).content.sub_chapter.chapter.tutorial.user)
      flash[:warning] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end 