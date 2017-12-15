class FriendsController < ApplicationController
	before_action :authenticate_user! , except: [:index,:show]
	def index
		@users=User.all
		@friends=current_user.friendships
		@friends_request=Friendship.all

	end
	def create 

	end
	def friends_request
		
		@request=Friendship.new(:requested_id =>params[:id],:user_id =>current_user.id,:request=>true )
	
		 respond_to do |format|
		      if @request.save
		        format.html { redirect_to friends_path }
		        format.json { render :show, status: :created, location: @link }
		      else
		        format.html { render :new }
		        format.json { render json: @link.errors, status: :unprocessable_entity }
		      end
   		 end

	end
	def friends_request_cancel
		
		 @friends=current_user.friendships
		 @friend=@friends.find_by(:requested_id =>params[:id])
		 respond_to do |format|
	      if @friend.destroy
	        format.html { redirect_to friends_path }
	        format.json { render :show, status: :ok, location: friends_path }
	      else
	        format.html { render :edit }
	        format.json { render json: @friend.errors, status: :unprocessable_entity }
	      end
	    end

	end


	def friends_confirm
					
		@resposnd=	Friendship.find_by(:requested_id=> current_user.id.to_s,:user_id=>params[:id])
		respond_to do |format|
			if @resposnd.update(:request=>0,:friend=>1)
			another_user=Friendship.new(:requested_id=>params[:id],:user_id=>current_user.id.to_s,:friend=>1)
			another_user.save
    		format.html { redirect_to friends_path }
	        format.json { render :show, status: :ok, location: friends_path }
	    	else
	    	format.html { render :edit }
	        format.json { render json: @resposnd.errors, status: :unprocessable_entity }
			end
		end

	end

	def myfriends

		@friendships=current_user.friendships
		if @friendships.where(:friend=>1).present?
		   @friends=@friendships.where(:friend=>1)
		else
			render "shared/_no_data_found"
		end
	end

end
