class Api::UsersController < ApplicationController

  def show
    user = User.includes(:posts).find(params[:id])

    render json: user.posts
  end
end