class Tutorial < ActiveRecord::Base
  belongs_to :subtopic
  belongs_to :user
  has_many :chapters, dependent: :destroy

  validates :title, :description, :user_id, presence: true
end
