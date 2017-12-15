class MessagesController < ApplicationController
	def index
		 @messages = Message.all
		 
		@users=Array.new
		@galleries=[]
		@profile=Array.new
		if current_user.friendships.where(:friend=>1).present?
			@friends_id= current_user.friendships.where(:friend=>1).select("id,requested_id")
			
			# all friends users
			@friends_id.each do |friends_id|
				@users << User.where(:id=>friends_id.requested_id)
			end

			#firend Gallery
			@users.each do |user|
				if user.first.galleries.present? 
									
				 @galleries<< user.first.galleries

				end
			end
			#firend Profiles
			@users.each do |user|
				if user.first.profile.present? 
									
				 @profile<< user.first.profile

				end
			end

		end
	end

	def user_chats

	
			#@messages = Message.where(:friend_id=>params[:id],:user_id=>current_user.id)
		    
    	@messages = Message.where(:friend_id=>params[:id],:user_id=>current_user.id).or(Message.where(:friend_id=>current_user.id,:user_id=>params[:id]))
	end

end
