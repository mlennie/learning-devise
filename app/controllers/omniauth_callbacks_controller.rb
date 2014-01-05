class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def twitter
		user = User.process_omniauth(request.env["omniauth.auth"])
	end 
end