Rails.application.routes.draw do
  root 'pages#home'
  resources :owner, only: [:index]
  get 'owner/show'
  get 'owner/create_company'
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users, controllers: {
    :passwords => "users/passwords",
    :sessions => "users/sessions",
    :registrations => "users/registrations"
  }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
  #
end
