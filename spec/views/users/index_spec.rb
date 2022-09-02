require 'rails_helper'

RSpec.describe 'Author index page', type: :feature do
  describe 'test for author index' do
    # @author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    # @post = Post.create(user_id:@author.id, title: 'Hello', text: 'This is my first post')
    # @author.save
    # @post.save

    scenario ' I can see the username of all authors.' do
      visit '/users'
      expect(page).to have_content('Tom')
    end
    scenario 'I can see the profile picture for each user.' do
      visit '/users'
      page.has_selector?('img')
    end

    scenario 'I can see the number of posts ' do
      visit '/users'
      expect(page).to have_content('Number of posts:')
    end

    scenario 'When I click on an author, I am redirected to that authors show page.' do
      visit '/users'
      first('.author_link').click
      expect(page).to have_content('See All Posts')
    end
  end
end
