class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id)
  end

  def all_posts
    @user = params[:user_id]
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @author_id = params[:author_id]
  end

  def create
    param = params.require(:posts).permit(:title, :text)
    @author = User.find(params[:author_id])
    # @author = current_user
    @post = Post.new(author: @author, title: param['title'], text: param['text'])
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.save!
    redirect_to "/users/#{@author.id}/posts"
  end
end
