class SessionsController < ApplicationController
	def create
		@user = User.find_by_credentials(session_params)
		if @user.nil?
			flash.now[:errors] = ['Incorrect email and/or password']
			render :new
		else 
			login_user!(@user)
			# redirect_to some_url
		end		
	end

	def destroy 
		logout_user!
		# redirect_to some_url
	end 

	def new 
		render :new
	end

	def show
		render :show
	end

	private 

	def session_params
		params.require(:session).permit(:email, :password)
	end
end