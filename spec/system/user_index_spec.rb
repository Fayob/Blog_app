require 'rails_helper'

describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'User Index' do
    before(:all) do
      @users = User.limit(5)
    end

    it 'shows name of each user' do
      visit root_path

      @users.each do |user|
        expect(page).to have_text(user.name)
      end
    end

    it "test for each user's photo" do
      visit root_path

      @users.each do |user|
        expect(page).to have_css("img[src*=\"#{user.photo}\"]")
      end
    end

    it 'shows number of posts each user has written' do
      visit root_path

      @users.each do |user|
        expect(page).to have_text(user.posts_counter)
      end
    end

    it 'redirects to user show page when clicking the user' do
      visit root_path

      user = @users.first
      click_on 'Show this user', match: :first

      expect(page).to have_current_path "/users/#{user.id}"
    end
  end
end
