module TutorialsHelper
  
  def tutorial_creator?
    user_signed_in? && current_user == Tutorial.find(params[:id]).user
  end

  def under_score(title)
    title.gsub(" ", "_")
  end
end