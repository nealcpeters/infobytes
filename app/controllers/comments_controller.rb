class CommentsController < ApplicationController
  def new
    @content = Content.find(params[:content_id])
    @comment = Comment.new
  end

  def create
    @content = Content.find(params[:content_id])
    if current_user
      @comment = Comment.new(comment_params.merge(user_id: current_user.id, content_id: @content.id))
    else
      @comment = Comment.new(comment_params.merge(content_id: @content.id))
    end
    if @comment.save
      redirect_to @content.sub_chapter
    else
      render "new"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.content.sub_chapter
  end

  def index
    @content = Content.find(params[:content_id])
    @comments = @content.comments
  end

  protected

  def comment_params
    params.require(:comment).permit(:body)
  end

end