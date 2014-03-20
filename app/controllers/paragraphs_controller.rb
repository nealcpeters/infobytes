class ParagraphsController < ApplicationController
  def new
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @paragraph = Paragraph.new
  end

  def edit
  end

  def update
  end

  def create
    @sub_chapter = SubChapter.find(params[:sub_chapter_id])
    @paragraph = Paragraph.new(paragraph_params)
    if @paragraph.save
      @paragraph.content = Content.create(sub_chapter_id: params[:sub_chapter_id], order_number: (@sub_chapter.contents.count + 1))
      flash[:notice]="Your new paragraph has been added!"
      redirect_to @sub_chapter
    else
      @errors = @paragraph.errors.messages
      render "new"
    end
  end

  protected

  def paragraph_params
    params.require(:paragraph).permit(:body)
  end
end