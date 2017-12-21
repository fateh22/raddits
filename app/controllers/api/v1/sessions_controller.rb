class Api::V1::SessionsController < ApplicationController
	protect_from_forgery with: :null_session
	 before_action :authenticate_user! , except: [:index,:create]
	def create 
		
		user = User.where(email:params[:email])

		if user.first and user.first.valid_password?(params[:password]) 
			
			render json: { status: 'success', message: 'loaded Links ', data:user,},status: :ok
			  
		else
			head(:unauthorised)
		end

	end


end
