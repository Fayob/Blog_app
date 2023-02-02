class CommentsController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    param = params.require(:comment).permit(:text)
    @comment = Comment.new(author: @user, post: @post, text: param[:text])
    @comment.save!
    redirect_to "/users/#{@user.id}/posts/#{@post.id}"
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = params[:post_id]
    @comment = Comment.where(author: @user, post_id: @post, id: params[:id])
    @comment.destroy(@comment.ids)
    redirect_to "/users/#{@user.id}/posts/#{@post}"
  end
end
