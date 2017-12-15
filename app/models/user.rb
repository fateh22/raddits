class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :messages, dependent: :destroy	
    has_many :friendships, dependent: :destroy	
	has_many :links, dependent: :destroy 
	has_one :profile, dependent: :destroy 
	has_many :galleries, dependent: :destroy 
	after_create :create_profile1
	def create_profile1
	  self.create_profile(:user_id => self.id)
	end


end
