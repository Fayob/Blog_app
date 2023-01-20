require './spec/rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.create(author_id: 1, title: 'Hello', text: 'This is my first post') }

  before { subject.save }

  it 'should test for author_id' do
    expect(subject.author_id).to eql 1
  end

  it 'should test for title' do
    expect(subject.title).to eql 'Hello'
  end

  it 'should test for text' do
    expect(subject.text).to eql 'This is my first post'
  end

  it 'should test for integers lesser than 0' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end

  it 'should test for integers greater than 0' do
    subject.comments_counter = 11
    expect(subject).to be_valid
  end

  it 'should respond to recent_five_comments method' do
    expect(subject).to respond_to(:recent_five_comments)
  end
end
