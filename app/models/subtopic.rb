class Subtopic < ActiveRecord::Base
  belongs_to :topic
  has_many :tutorials

  validates :title, :description, :presence => true
end
