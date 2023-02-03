class Api::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(author: current_user, post: post, text: param["text"] )
    render plain: comment.inspect

    # if comment.save 
    #   render json: comment, status: 200
    # else
    #   render json: {
    #     error: "Unable to create comment"
    #   }
    # end
  end

  private

  def param
    params.require(:comment).permit(:text)
  end
end