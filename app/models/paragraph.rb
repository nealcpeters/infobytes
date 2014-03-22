class Paragraph < ActiveRecord::Base
  has_one :content, as: :attachable,  dependent: :destroy
  validates :body, presence: true
end
