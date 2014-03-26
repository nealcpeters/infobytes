class Community < ActiveRecord::Base
	belongs_to :tutorial
	has_and_belongs_to_many :users

	validates :name, :presence => :true, :uniqueness => true
	validates :description, :presence => true
end
