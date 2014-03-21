class User < ActiveRecord::Base
  has_many :tutorials
  has_many :chapters, through: :tutorials
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, 
  	:presence => true, 
  	:uniqueness => true, 
  	:length => { :maximum => 32 }

 	validates_format_of :user_name, :with => /\A[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*\z/ 
end


