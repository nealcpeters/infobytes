class Content < ActiveRecord::Base
  belongs_to :sub_chapter
  belongs_to :attachable, polymorphic: true
  has_many :comments, dependent: :destroy
end
