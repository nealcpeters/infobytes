class Image < ActiveRecord::Base
	has_one :content, as: :attachable,  dependent: :destroy

	has_attached_file :image_path, :styles => { 
																   original: '600x800>'
																 }, 
																 :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image_path, :content_type => /\Aimage\/.*\Z/
  
  validates :image_path, :attachment_presence => true
end