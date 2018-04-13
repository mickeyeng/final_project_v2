Rails.application.routes.draw do
  get 'tags/show'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  get  'pages/index'
  get  'pages/users'
  get  'chatrooms/index'


   


  # get 'chatrooms/index', :to => "chatrooms/index", :as => chatroom_index


  # changes login to /login
	devise_scope :user do
		get 'login', to: 'devise/sessions#new'
	end	

	

	devise_scope :user do
		get 'sign_up', to: 'devise/registrations#new'
	end	


	resources :chatrooms do
		resource :chatroom_users
	    resources :messages
	end


	resources :posts do 
		member do
			put 'like' => 'posts#vote'
		end
		resources :comments
	end 

	resources :tags

	



	

	# namespace :admin do
 #  		resources :chatromms, :pages
	# end

  resources :direct_messages

  root to: "pages#index"
end
