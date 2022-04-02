Rails.application.routes.draw do
  root to: 'pages#home'
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users, controllers: {
    :sessions => "users/sessions",
    :registrations => "users/registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
  #
end
