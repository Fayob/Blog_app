class Api::PostsController < ApplicationController
  skip_before_action :authenticate_request

  def index
    user = User.includes(:posts).find(params[:user_id])

    render json: user.posts
  end
end
