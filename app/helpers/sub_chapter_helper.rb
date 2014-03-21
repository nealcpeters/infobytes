module SubChapterHelper

  def sub_chapter_owner?(sub_chapter)
    current_user == sub_chapter.chapter.tutorial.user  
  end

end