class Api::V1::LinksController < ApplicationController
	 before_action :authenticate_user! , except: [:index]
			  def index
			    @links = Link.all
			    	render json: { status: 'success', message: 'loaded Links ', data:@links,},status: :ok
			  end
end 

