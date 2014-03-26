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

  def update_order
    params[:data].each do |content_id, content_order| 
      content_item = Content.find(content_id)
      content_item.order_number = content_order
      content_item.save
    end
    render json: {message: "great success"}
  end
end
