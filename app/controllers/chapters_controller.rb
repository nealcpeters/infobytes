class ChaptersController < ApplicationController

	def new
    @tutorial = Tutorial.find(params[:tutorial_id])
    @chapter = Chapter.new
	end 

	def create
    @tutorial = Tutorial.find(params[:tutorial_id])
    @chapter = @tutorial.chapters.new(chapter_params)

    if @chapter.save
      flash[:notice] = "Chapter #{@chapter.number}: #{@chapter.title} added."
      redirect_to @chapter
    else
      @errors = @chapter.errors.messages
      render 'new'
    end
	end

	def edit

	end

	def update

	end

	def destroy

	end

	private

	def chapter_params
    params.require(:chapter).permit(:title, :number)
	end
end