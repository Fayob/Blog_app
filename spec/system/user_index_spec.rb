require 'rails_helper'

describe "user index page", type: :system do 

  before do
    @user = User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter:10)
  end

  it 'should show the username of all users' do
    visit root_path
    expect(page).to have_content('Tom')
    expect(page).to have_content('John')
    expect(page).to have_content('James')
    expect(page).to have_content('Lilly')
    expect(page).not_to have_content('Jane')
  end
  
  it 'should test profile picture for each user' do
    visit root_path
    expect(@user.photo).to be_present
  end

  it 'test number of posts' do
    visit root_path
    expect(@user.posts_counter).to eql(10)
    expect(page).to have_content('Number of posts')
  end

  it "test for when user click and redirected to that user's show page" do 
    visit root_path
    click_on 'Show this user', match: :first
    expect(page).to have_current_path("/users/43")
  end
end
