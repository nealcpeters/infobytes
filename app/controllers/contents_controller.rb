class ContentsController < ApplicationController
  def up
    @content = Content.find(params[:content_id])
    @content.update(order_number: @content.order_number -= 1)    
    @maker = @content.sub_chapter.chapter.tutorial.user
    redirect_to (tutorial_path(@maker))
  end

  def down
    @content = Content.find(params[:content_id])
    @content.update(order_number: @content.order_number += 1)    
    @maker = @content.sub_chapter.chapter.tutorial.user
    redirect_to (tutorial_path(@maker))
  end
end
