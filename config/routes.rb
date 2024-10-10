Rails.application.routes.draw do
  get 'contact_form/index'
  get 'errors/not_found'
  get 'errors/internal_server_error'
  get 'pages/how_it_works'
  devise_for :users, controllers: { sessions: "devise/passwordless/sessions" }

  devise_scope :user do
    get '/users/sign_out' => 'devise/passwordless/sessions#destroy'
 end

  resources :flows
  get 'contact', to: 'contact_form#index'
  post 'contact', to: 'contact_form#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  # Defines the root path route ("/")
  root "flows#index"
end
