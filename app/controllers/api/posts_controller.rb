class Api::PostsController < ApplicationController
  
  def show
    user = User.includes(:posts).find(params[:user_id])
    post = user.posts.includes(:comments).find(params[:id])

    render json: post.comments
  end
end