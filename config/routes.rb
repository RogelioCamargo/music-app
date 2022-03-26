Rails.application.routes.draw do
	resource :session, only: [:create, :destroy, :new, :show]
  resources :users, only: [:create, :new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
