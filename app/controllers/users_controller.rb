class UsersController < ApplicationController
	def profile
	end
	def sign_up
		@user = User.new(user_params)
		if @user.save
			redirect_to "/"
			else
		    render sign_up
		end
	end
	def sign_in
		@user = User.new
	end

	def create
		render html: params
	end

	private
	def user_params
		params.require()
    end
end