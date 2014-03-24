class Tutorial < ActiveRecord::Base
  belongs_to :subtopic
  belongs_to :user
  has_many :chapters, dependent: :destroy

  validates :title, :description, :user_id, presence: true

  def self.search(search)
  	search_condition = "%" + search + "%"
  	find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
	end


end
