class SubChapter < ActiveRecord::Base
  belongs_to :chapter
  has_many :contents

  validates :title, :presence => true

  def update_data(chapter, order)
    this.chapter_id = chapter
    this.number = order
    this.save
  end
end
