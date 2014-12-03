class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		@user = User.authenticate(user_params)
		if @user
			@user.login
			render json: @user
		else
			render json: "wrong email/password combination"
	end

	private
	def user_params
		params.require(:user).permit(:email, :password)
	end
end
