class Tutorial < ActiveRecord::Base
  belongs_to :subtopic
  belongs_to :user
end
