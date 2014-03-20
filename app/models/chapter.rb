class Chapter < ActiveRecord::Base
	belongs_to :tutorial

	validates :title, presence: true
end
