require 'rails_helper'

describe Comment do
  first_comment = Comment.create(post_id: 1, user_id: 1, text: 'Hi Tom!')

  subject { first_comment }

  before { subject.save }

  it 'text to not be empty' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'post_id should be an integer' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be an integer' do
    subject.user_id = 'k'
    expect(subject).to_not be_valid
  end
end
