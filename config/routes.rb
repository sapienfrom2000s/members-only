Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
  # Defines the root path route ("/")
  get '/posts' => "posts#index", :as => :user_root
end
