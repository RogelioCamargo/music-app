Rails.application.routes.draw do
  resources :albums, only: %i(create destroy edit update show)
  resources :bands do 
		resources :albums, only: %i(new)
	end
	resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "bands#index"
end
