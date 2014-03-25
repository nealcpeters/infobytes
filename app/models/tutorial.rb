class Tutorial < ActiveRecord::Base
  belongs_to :subtopic
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_one :community
  has_many :ratings

  validates :title, :description, :user_id, presence: true

  def self.search(search)
  	search_condition = "%" + search + "%"
  	find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
	end

  def update_chapter_order
    self.chapters.order(:number).each_with_index do |chap, index|
      chap.number = index + 1
      chap.save
    end
  end

  
end
