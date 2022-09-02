require 'rails_helper'
RSpec.feature 'post_index', type: :feature do
  describe 'test for user show' do
    before(:example) do
      @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.create(user_id:@author.id, title: 'Hello', text: 'This is my first post')
      visit "/users/#{@author.id}/posts"
    end

    scenario 'shows the user\'s profile picture' do
      page.has_selector?('img')
    end

    scenario 'can see the user\'s username' do
      expect(page).to have_content(@author.name.to_s)
    end

    scenario 'can see the user\'s number of posts' do
      expect(page).to have_content("Number of posts:1")
    end
    scenario 'can see the post\'s title' do
      expect(page).to have_content(@post.title)
    end
    scenario 'can see the post\'s body' do
      expect(page).to have_content(@post.text)
    end
    scenario 'can see the post\'s comments' do
      expect(page).to have_content(@post.comments.first)
    end
    scenario 'can see the post\'s number of comments' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end
    scenario 'can see the post\'s number of likes' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end

    scenario 'redirects to the post\'s page when a post is clicked' do
      first('.link').click
      expect(page.current_path).to eql("/users/#{@author.id}/posts/#{@post.id}")
    end
  end
end
