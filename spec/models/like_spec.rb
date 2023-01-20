require './spec/rails_helper'

RSpec.describe Like, type: :model do

  subject { Like.create(author_id: 1, post_id: 2) }

  before { subject.save }

  it 'should test for author_id' do
    expect(subject.author_id).to eql 1
  end

  it 'should test for post_id' do
    expect(subject.post_id).to eql 2
  end
end