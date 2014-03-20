class Image < ActiveRecord::Base
	has_one :content, as: :attatchable,  dependent: :destroy

	has_attached_file :image_path, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_path, :content_type => /\Aimage\/.*\Z/
  validates :image_path, :attachment_presence => true
end