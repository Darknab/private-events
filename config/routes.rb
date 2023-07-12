Rails.application.routes.draw do
  devise_for :users, controllers: {
       sessions: 'users/sessions' 
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events, :users, :participations
     
  # Defines the root path route ("/")
   root "events#index"
end
