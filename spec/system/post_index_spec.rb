require 'rails_helper'

describe 'Posts Index Page', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:all) do
    @user = User.first
    @posts = Post.where(author_id: @user.id).includes(:comments)
  end

    it "shows the user's profile photo" do
      visit ("/users/#{@user.id}/posts")

      expect(page).to have_css("img[src*=\"#{@user.photo}\"]")
    end

    it "shows the user's name" do
      visit ("/users/#{@user.id}/posts")

      expect(page).to have_text(@user.name)
    end

    it "shows the user's number of posts" do
      visit ("/users/#{@user.id}/posts")

      expect(page).to have_content(@user.posts_counter)
    end

    it "shows post's title of each post" do
      visit ("/users/#{@user.id}/posts")

      @posts.each do |post|
        expect(page).to have_text(post.title)
      end
    end

    it "shows post's description of each post" do
      visit ("/users/#{@user.id}/posts")

      @posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'shows number of comments for each post' do
      visit ("/users/#{@user.id}/posts")

      @posts.each do |post|
        expect(page).to have_text(post.comments_counter)
      end
    end

    it 'shows number of likes for each post' do
      visit ("/users/#{@user.id}/posts")

      @posts.each do |post|
        expect(page).to have_text(post.likes_counter)
      end
    end

    it 'shows the first comments on a post' do
      visit ("/users/#{@user.id}/posts")

      @posts.each do |post|
        if post.comments_counter > 0
          comment = post.comments.first
          expect(page).to have_content(comment.text)
        end
      end
    end

    it "redirects to post show page when click on a post" do
      visit("/users/#{@user.id}/posts")
      post = @posts.first
      click_on 'Show this post', match: :first

      expect(page).to have_current_path "/users/#{@user.id}/posts/#{post.id}"

    end
end
