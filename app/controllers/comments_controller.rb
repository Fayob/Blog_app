class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    param = params.require(:comment).permit(:text)
    @comment = Comment.new(author: @user, post: @post, text: param[:text])
    @comment.save!
    redirect_to "/users/#{@user.id}/posts/#{@post.id}"
  end
end
