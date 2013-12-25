class UserController < ApplicationController
	before_action :authenticate_user!

  def index
  end

  def create
  end

  private

  	def user_params
  		params.require(:user).permit(:login)
  	end
end