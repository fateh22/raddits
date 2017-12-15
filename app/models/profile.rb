class Profile < ApplicationRecord
  belongs_to :user, required: true, autosave: true
  mount_uploader :image, ImageUploader
	
	
	# after_save :update_email_address
	# def update_email_address
	# 	@user = User.find(self.user_id)
	# 	@user.update(:email => self.email)
	# end



  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 5.5.megabytes
  end
end
