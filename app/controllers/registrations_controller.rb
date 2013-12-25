class RegistrationsController < Devise::RegistrationsController
  
  def update
  	new_params = params.require(:user).permit(:email, :username, :current_password, :password, :password_confirmation)
  	@user = User.find(current_user.id)
  	change_password = true

  	if params[:user][:password].blank?
  		params[:user].delete("password")
  		params[:user].delete("password_confirmation")
  		new_params = params.require(:user).permit(:email, :username)
  		change_password = false
  	end

  	if change_password 
  		if @user.update_with_password(new_params)
	  		set_flash_message :notice, :updated
	  		sign_in @user, :bypass => true
	  		redirect_to after_update_path_for(@user)
	  	else
	  		render "edit"
	  	end
  	else
  		if @user.update_without_password(new_params)
	  		set_flash_message :notice, :updated
	  		sign_in @user, :bypass => true
	  		redirect_to after_update_path_for(@user)
	  	else
	  		render "edit"
	  	end
  	end
  end
end
