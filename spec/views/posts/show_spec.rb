require 'rails_helper'
RSpec.describe 'post_show', type: :feature do
  before(:each) do
    @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(user_id: @author.id, title: 'Hello', text: 'This is my first post', id: 1)
    @comment = Comment.create(text: 'nice job', user_id: @author.id, post_id: @post.id)
    visit "/users/#{@author.id}/posts/#{@post.id}"
  end
  scenario 'can see the post\'s title' do
    expect(page).to have_content(@post.title)
  end
  scenario 'can see the post\'s author name' do
    expect(page).to have_content(@author.name)
  end
  scenario 'can see the post\'s number of comments' do
    expect(page).to have_content('Comments:1')
  end
  scenario 'can see the post\'s number of likes' do
    expect(page).to have_content("Likes:#{@post.likes_counter}")
  end
  scenario 'can see the post\'s body' do
    expect(page).to have_content(@post.text)
  end
  scenario 'can see the name of the commentor' do
    expect(page).to have_content(@author.name)
  end
  scenario 'can see the comment\'s text' do
    expect(page).to have_content(@comment.text)
  end
end
