class Like < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :author_id
  belongs_to :post
  after_create :increase_post_likes_counter
  after_destroy :decrease_post_likes_counter

  private

  def increase_post_likes_counter
    post.increment!(:likes_counter)
  end

  def decrease_post_likes_counter
    post.decrement!(:likes_counter)
  end
end
