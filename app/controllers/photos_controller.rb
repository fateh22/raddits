class PhotosController < ApplicationController

	def index
		@galleries = current_user.galleries.all
		@gallery=current_user.galleries.new

	end

	def create

	@image = current_user.galleries.new(image_params)
		respond_to do |format|
	    if @image.save
	    format.html { redirect_to photos_path, notice: 'Image   successfully Uploaded.' }
	   
	      format.json { render :index, status: :ok, fileID: @image.id ,:status => 200, message: "success" }
	    else
	      
	     format.html { render :index }
        	format.json { render json:  @image.errors.full_messages.join(','), status: 400 }
	    end
		end
	end

	def destroy
    	@gallery = current_user.galleries.find(params[:id])
    	respond_to do |format|
	   		if @gallery.destroy  
	     		format.html { redirect_to photos_path, notice: 'Image successfully deleted.' }  
	      		format.json { head :no_content}
		    else
		    	format.html { render :index }
		      	render json: { message: @gallery.errors.full_messages.join(',') }
		    end
		end
  	end

  	def cover_image
  				current_user.galleries.update(:cover_image=>0)
  	  @gallery=	current_user.galleries.find(params[:id])
  	  respond_to do |format|
      if @gallery.update(:cover_image=>1)
        format.html { redirect_to photos_path, notice: 'Cover Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery}
      else

        format.html { render "index" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end


  	end
  	def cover_popup
  				current_user.galleries.update(:cover_image=>0)
  	  @gallery=	current_user.galleries.find(params[:id])
  	  respond_to do |format|
      if @gallery.update(:cover_image=>1)
        format.html { redirect_to dashboard_user_profile_index_path(current_user) }
        format.json { render :show, status: :ok, location: @gallery}
      else

        format.html { render "index" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
  		end
  	end

  	def profile_photo
  				current_user.galleries.update(:profileimage=>0)
			  	  @gallery=	current_user.galleries.find(params[:id])
			  	  respond_to do |format|
			      if @gallery.update(:profileimage=>1)
			        format.html { redirect_to photos_path, notice: 'Profile Image was successfully updated.' }
			        format.json { render :show, status: :ok, location: @gallery}
			      else

			        format.html { render "index" }
			        format.json { render json: @gallery.errors, status: :unprocessable_entity }
			      end
			    end

  	end


	private
	  def image_params
	   
	    params.require(:gallery).permit!
	  end
end
