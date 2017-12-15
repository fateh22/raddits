class Gallery < ApplicationRecord
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>",:thumb => "100x100>" },:default_url=> '/images/missing_:style.png'
	
	validates_attachment 	:image, 
				:presence => true,
				:content_type => { :content_type => /\Aimage\/.*\Z/ },
				:size => { :less_than => 1.megabyte }
				
end
