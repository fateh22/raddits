class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :profile_data
    before_action :chat_users
    def profile_data
     	if user_signed_in?
    	  @galleries=	current_user.galleries
    		 if @galleries.empty? 
			 @profile_pic="empty_profile"
			 else 
			 	if @cover_image=@galleries.find_by(:cover_image => 1).present? 
			 		@cover_image=@galleries.find_by(:cover_image => 1)
			 		@cover=@cover_image.image.url  
			 	else
				@cover="unknown"
			 	end
			 	 if @galleries.find_by(:profileimage => 1).present?
							 
				 	profile_image = @galleries.find_by(:profileimage => 1)
					@profile_pic = profile_image.image.url 
				else
					 @profile_pic="empty_profile"
				end

			 end 
    	end
    	
   	end

   	def chat_users
   		if user_signed_in?
   		@chat_users=Array.new
		@chat_galleries=[]
		@chat_profile=Array.new
		if current_user.friendships.where(:friend=>1).present?
			@friends_id= current_user.friendships.where(:friend=>1).select("id,requested_id")
			
			# all friends users
			@friends_id.each do |friends_id|
				@chat_users << User.where(:id=>friends_id.requested_id)
			end

			#firend Gallery
			@chat_users.each do |user|
				if user.first.galleries.present? 
									
				 @chat_galleries<< user.first.galleries

				end
			end
			#firend Profiles
			@chat_users.each do |user|
				if user.first.profile.present? 
									
				 @chat_profile<< user.first.profile

				end
			end

		end

   		end
  	end
end
