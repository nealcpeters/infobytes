module ChaptersHelper
  def chapter_creator?
    user_signed_in? && current_user == Chapter.find(params[:id]).tutorial.user
  end
end