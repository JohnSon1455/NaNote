Rails.application.routes.draw do
	resources :layouts

	resources :notes
	get "/",to: "notes#index"

	resources :notes

	get "/hello", to: "pages#main"
	get "/about", to: "pages#about"
	# get "/users", to: "users#profile"

	resources :users, only: [:create] do
		collection do
			get :sign_up
			get :sign_in
		end
	end
	post "/users/sign_in", to: "senction#create",as: "login"
	delete "/users", to: "senction#destroy",as: "logout"
end
