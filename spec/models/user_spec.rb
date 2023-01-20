require './spec/rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

  before { subject.save }

  it 'should test for presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should test for empty name' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'should test for integer' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'should test for integers lesser than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should test for integers greater than 0' do
    subject.posts_counter = 11
    expect(subject).to be_valid
  end

  it 'should respond to recent_three_posts method' do
    expect(subject).to respond_to(:recent_three_posts)
  end
end
