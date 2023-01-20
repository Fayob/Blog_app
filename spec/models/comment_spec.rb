require './spec/rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!') }

  before { subject.save }

  it 'should test for author_id' do
    expect(subject.author_id).to eql 2
  end

  it 'should test for post_id' do
    expect(subject.post_id).to eql 1
  end

  it 'should test for text' do
    expect(subject.text).to eql 'Hi Tom!'
  end
end
