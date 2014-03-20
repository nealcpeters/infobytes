class Subtopic < ActiveRecord::Base
  belongs_to :topic
  has_many :tutorials
end
