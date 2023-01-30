class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    param = params.require(:like)
    if param['like'].to_i == 1
      @like = Like.new(author: @user, post: @post)
      @like.save!
    else
      @like = Like.where(author: @user, post: @post)
      @like.destroy(@like.ids)
    end
  end
end
