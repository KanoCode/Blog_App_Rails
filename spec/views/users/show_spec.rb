require 'rails_helper'

RSpec.describe 'show author tests', type: :feature do
  describe 'test for author show' do
    before(:example) do
      @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.create(user_id:@author.id, title: 'Hello', text: 'This is my first post')
      visit "/users/#{@author.id}"
    end

    scenario 'I can see the author profile picture.' do
      page.has_selector?('img')
    end

    scenario 'I can see the number of posts ' do
      expect(page).to have_content("Number of posts:1")
    end

    # scenario 'I can see the user\'s recent posts' do
    #   expect(page).to have_content("#{@author.posts.first}")
    # end

    scenario 'I can see the user username.' do
      
      expect(page).to have_content(@author.name)
    end

    scenario 'I can see user bio ' do
      expect(page).to have_content(@author.bio)
    end

    scenario 'When I click to see one post, it redirects me to that post.' do
      first('.single_post').click

      expect(page.current_path).to eql("/users/#{@author.id}/posts/#{@post.id}")
    end

    scenario 'When I click to see all posts, it redirects me to the authors posts index page.' do
       click_link('See all posts')
      expect(page.current_path).to eql("/users/#{@author.id}/posts")
    end
  end
end
