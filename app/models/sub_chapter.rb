class SubChapter < ActiveRecord::Base
  belongs_to :chapter
  has_many :contents

  validates :title, :presence => true

  def update_data(chapter, order)
    self.chapter_id = chapter
    self.number = order
    self.save
  end
end
