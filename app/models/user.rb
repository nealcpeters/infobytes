class User < ActiveRecord::Base
  include Gravtastic
  gravtastic(:secure => "true",
             :rating => "G",
             :size => 250) 
  
  has_many :tutorials
  has_many :chapters, through: :tutorials
  has_and_belongs_to_many :communities
  has_many :comments
  has_many :ratings

  has_gravatar
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, 
  	:presence => true, 
  	:uniqueness => true, 
  	:length => { :maximum => 32 }

 	validates_format_of :user_name, :with => /\A[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*\z/ 

  def fullname
    "#{self.first_name} #{self.last_name}" 
  end
end


