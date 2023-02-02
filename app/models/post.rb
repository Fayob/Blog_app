class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  after_create :increase_author_posts_counter
  after_destroy :decrease_author_posts_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increase_author_posts_counter
    author.increment!(:posts_counter)
  end

  def decrease_author_posts_counter
    author.decrement!(:posts_counter)
  end
end
