class Topic < ActiveRecord::Base
  has_many :subtopics

  validates :title, :presence => true
end
