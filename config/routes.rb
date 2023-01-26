Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:user_id/posts", to: "posts#index"
  get "/users/:user_id/all_posts", to: "posts#all_posts"
  get "/users/:author_id/posts/new", to: "posts#new"
  post "/users/:author_id/posts/create", to: "posts#create"
  get "/users/:user_id/posts/:id", to: "posts#show"
  post "/users/:user_id/posts/:post_id/comments", to: "comments#create"
  post "/users/:user_id/posts/:post_id/likes", to: "likes#create"

  # Defines the root path route ("/")
  # root "articles#index"
end
