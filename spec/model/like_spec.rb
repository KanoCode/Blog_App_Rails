require 'rails_helper'

describe Like do
  first_like = Like.create(post_id: 1, user_id: 1)

  subject { first_like }

  before { subject.save }

  it 'post_id should be an integer' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be an integer' do
    subject.user_id = 'k'
    expect(subject).to_not be_valid
  end
end
