class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def provider
		user = User.process_omniauth(request.env["omniauth.auth"])
		if user.persisted?
			flash.notice = "Signed in!"
			sign_in_an_redirect user
		else
			session["devise.user_attributes"] = user.attributes 
			redirect_to new_user_registration_url
		end
	end 

	alias_method :twitter, :provider
	alias_method :facebook, :provider
end