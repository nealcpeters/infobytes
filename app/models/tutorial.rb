class Tutorial < ActiveRecord::Base
  belongs_to :subtopic
  belongs_to :user
  has_many :chapters

  validates :title, :description, presence: true
end
