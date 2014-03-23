module SubTopicsHelper
  
  def authorship(tutorial)
    name = tutorial.user.user_name
    created_at = tutorial.created_at
    "by #{name} · #{distance_of_time_in_words(created_at, DateTime.now)} ago"
  end
end