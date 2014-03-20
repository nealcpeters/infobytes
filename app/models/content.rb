class Content < ActiveRecord::Base
  belongs_to :sub_chapter
  belongs_to :attatchable, polymorphic: true
end
