require 'rails_helper'

describe User do
  # test
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

  subject { first_user }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter must be an integer' do
    subject.postsCounter = 1
    expect(subject.postsCounter).to be >= 0
  end
end
