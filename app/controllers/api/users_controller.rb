class Api::UsersController < ApplicationController
  skip_before_action :authenticate_request

  def show
    user = User.includes(:posts).find(params[:id])

    render json: user.posts
  end
end
