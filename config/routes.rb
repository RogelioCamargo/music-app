Rails.application.routes.draw do
  resources :bands
	resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
