require 'rails_helper'

describe User do
  # test
  # first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.new(user_id: 1, title: 'Hello', text: 'This is my first post')
  subject { first_post }

  before { subject.save }

  it 'title should not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title length should be between 0 and 250' do
    subject.title = 'first_post.title.length'

    expect(subject.title.length).to_not be > 250
  end

  it 'likesCounter must be an integer greater than or equal to 0' do
    subject.comments_counter = 1
    expect(subject.comments_counter).to be >= 0
  end

  it 'commentsCounter must be an integer greater than or equal to 0' do
    subject.comments_counter = 1
    expect(subject.comments_counter).to be >= 0
  end
end
