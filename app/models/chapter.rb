class Chapter < ActiveRecord::Base
	belongs_to :tutorial
  has_many :sub_chapters, dependent: :destroy

  def creator
    self.tutorial.user
  end
end
