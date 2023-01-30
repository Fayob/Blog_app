class Comment < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: :User
  belongs_to :post
  after_create :increase_post_comments_counter
  after_destroy :decrease_post_comments_counter

  private

  def increase_post_comments_counter
    post.increment!(:comments_counter)
  end

  def decrease_post_comments_counter
    post.decrement!(:comments_counter)
  end
end
