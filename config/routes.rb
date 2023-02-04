Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"
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
