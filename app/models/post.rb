class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes
  after_create :updates_author_posts_counter

  def updates_author_posts_counter
    author.increment!(:posts_counter)
  end

  private :updates_author_posts_counter

  def recent_five_posts
    comments.order(created_at: :desc).limit(5)
  end
end
