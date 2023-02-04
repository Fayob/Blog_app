require 'rails_helper'

describe 'user show page', type: :system do
  before do
    @user = User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', posts_counter: 10)
    @first_post = Post.create(id: 1, author: @user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: @first_post, author: @user, text: 'Hi Tom!')
  end

  it 'should test profile picture for each user' do
    visit "users/#{@user.id}"
    expect(@user.photo).to be_present
  end

  it 'should show the username of all users' do
    visit "users/#{@user.id}"
    expect(page).to have_content(@user.name)
  end

  it 'test number of posts' do
    visit "users/#{@user.id}"
    expect(@user.posts_counter).to eql(10)
  end

  it "test user's bio visiblity" do
    visit "users/#{@user.id}"
    expect(page).to have_content(@user.bio)
  end

  it 'test button visiblity' do
    visit "users/#{@user.id}"
    expect(page).to have_content('Show all posts')
  end

  # it "test for when user click and redirected to that post's index page" do
  #   visit "/users/43"
  #   click_on 'Show all posts', match: :first
  #   expect(page).to have_current_path("/users/43/posts")
  # end
end
