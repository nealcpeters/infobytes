class Paragraph < ActiveRecord::Base
  has_one :content, as: :attatchable,  dependent: :destroy
  validates :body, presence: true
end
