class User < ApplicationRecord
  # acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :author_id, dependent: :delete_all
  has_many :comments, foreign_key: 'author_id', dependent: :delete_all
  has_many :likes, foreign_key: :author_id, dependent: :delete_all

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_three_posts
    posts.order(created_at: :desc).limit(3)
  end

  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end

  # private

  def admin?
    role == 'admin'
  end
end
