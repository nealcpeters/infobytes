class Tutorial < ActiveRecord::Base
  belongs_to :subtopic
  belongs_to :user


  validates :title, :description, presence: true
end
