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
    @post = Post.new
    @author = current_user
  end

  def create
    param = params.require(:posts).permit(:title, :text)
    @author = current_user
    @post = Post.new(author: @author, title: param['title'], text: param['text'])
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:notice] = 'Post was created successfully'
      redirect_to "/users/#{@author.id}/posts"
    else
      render 'new'
    end
  end
end
