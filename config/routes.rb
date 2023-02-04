Rails.application.routes.draw do
  # scope :api, defaults: {format: :json} do
  #   devise_for :users 
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end

  post "/api/auth/login", to: "api/authentication#login"
  

  root "users#index"
  get "/users/v1", to: "api#index"
  get "/users/:id", to: "users#show"
  get "/users/:user_id/posts", to: "posts#index"
  get "/users/:user_id/all_posts", to: "posts#all_posts"
  get "/users/:user_id/posts/new", to: "posts#new"
  post "/users/:user_id/posts/create", to: "posts#create_post"
  get "/users/:user_id/posts/:id", to: "posts#show"
  get "/users/:user_id/posts/:id/edit", to: "posts#edit"
  patch "/users/:user_id/posts/:id/update", to: "posts#update"
  delete "/users/:user_id/posts/:id/destroy", to: "posts#destroy"
  post "/users/:user_id/posts/:post_id/comments", to: "comments#create"
  delete "/users/:user_id/posts/:post_id/comment/:id", to: "comments#destroy"
  post "/users/:user_id/posts/:post_id/likes", to: "likes#create"

  # Defines the root path route ("/")
  # root "articles#index"
end
