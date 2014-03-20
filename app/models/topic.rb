class Topic < ActiveRecord::Base
  has_many :subtopics
end
