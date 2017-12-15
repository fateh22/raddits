class ProfileController < ApplicationController
  
  def index
    @profile = current_user.profile
  end
  def update
     @profile = current_user.profile
      respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to  user_profile_index_path(@profile), notice: 'Profile  was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end

  end


  def update_password

  
    @profile = current_user.profile
    respond_to do |format|
      if current_user.update_with_password(user_params)
        format.html { redirect_to user_session_path, notice: 'Password  was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else

        format.html { render "index" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end

  end

  def dashboard
    if current_user
     @profile =  current_user.profile
    else
        
        @profile =  @user.profile
    end
  #if current_user.galleries.blank?
  # @galleries = current_user.galleries.new
  #else
  #@galleries = current_user.galleries
  #end

    @galleries = current_user.galleries

  end

  def update_email

    @profile = current_user.profile
    respond_to do |format|
      if profile_params[:email]
          if @profile.update(:first_name => profile_params[:first_name], :last_name =>profile_params[:last_name])
         current_user.update(:email=>profile_params[:email])
        format.html { redirect_to  user_profile_index_path(@profile), notice: 'Profile  was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end

      else

      end
   end
  end

  def user_destroy

      current_user.destroy
      respond_to do |format|
       format.html { redirect_to  new_user_registration_path, notice: 'Account  was successfully deleted.' }
       format.json { head :no_content}
      end
  end


  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit!

  end
  private 
  def profile_params 
    
    params.require(:profile).permit!

  end

end
