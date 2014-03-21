class SubChapter < ActiveRecord::Base
  belongs_to :chapter
  has_many :contents

  validates :title, :presence => true
end
