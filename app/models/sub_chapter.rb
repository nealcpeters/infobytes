class SubChapter < ActiveRecord::Base
  belongs_to :chapter
  has_many :contents
end
