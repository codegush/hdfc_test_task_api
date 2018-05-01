Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
      resources :users
      post 'login', to: 'sessions#create'
      get 'auth/:provider/callback' => 'sessions#create'
      get 'users/profile' => 'users#show'
  	end
  end
end
