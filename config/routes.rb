Rails.application.routes.draw do
  devise_for :users

  # changes login to /login
	devise_scope :user do
		get 'login', to: 'devise/sessions#new'
	end	

	resources :chatrooms do
		resource :chatroom_users
	    resources :messages
	 end

  resources :direct_messages

  root to: "chatrooms#index"
end
