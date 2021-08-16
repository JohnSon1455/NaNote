class senctionsController < ApplicationController
	def create
		pw =user_params[:password]
		salted_pw = "xyz#{self.password}"
        self.password = Digest::SHA1.hexdigest(salted_pw)
		user = User.find_by(email: user_params[:email],
							password: hashed_password)
		if user
			session[:yyy] =user.id
			render html: "ok"
		else
			redirect_to "/users/sign_in"
		end

		private
		def user_params
			params.require(:user).permit(:email, :password)
		end
		render :new
		
	end
end