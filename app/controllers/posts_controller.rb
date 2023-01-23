class PostsController < ApplicationController
  def index
    render 'posts_index'
  end

  def show
    render 'posts_show'
  end
end
