Rails.application.routes.draw do
  resources :orders
  get 'errors/not_found'
  get 'errors/internal_server_error'
  resources :cars
  root 'pages#home'
  resources :owner
  get '/about_us', to: 'pages#about_us', as: 'about_us'
  get '/catalog/:id/detail', to: 'pages#detail', as: 'catalog_detail'
  get '/catalog', to: 'pages#catalog', as: 'catalog'
  get '/owner/company', to: 'owner#company', as: 'company'

  get '/owner/new_company', to: 'owner#new_company', as: 'new_company'
  post '/owner/create_company', to: 'owner#create_company', as: 'create_company'
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users, controllers: {
    :passwords => "users/passwords",
    :sessions => "users/sessions",
    :registrations => "users/registrations"
  }
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
  #
end
