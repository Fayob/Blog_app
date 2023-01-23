class UsersController < ApplicationController
  def index
    render 'users_index'
  end

  def show
    # @user = User.find(params[:id])
    render 'users_show'
  end
end
