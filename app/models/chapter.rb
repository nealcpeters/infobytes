class Chapter < ActiveRecord::Base
	belongs_to :tutorial
  has_many :sub_chapters, dependent: :destroy

	validates :title, presence: true
end
