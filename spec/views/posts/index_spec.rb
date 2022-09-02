require 'rails_helper'
RSpec.feature 'post_index', type: :feature do
  describe 'test for user show' do
    before(:example) do
      @user = User.first
      @post = Post.first
      visit "/users/#{@user.id}/posts"
    end
    scenario 'shows the user\'s profile picture' do
      page.has_selector?('img')
    end
    scenario 'can see the user\'s username' do
      expect(page).to have_content(@user.name.to_s)
    end
    scenario 'can see the user\'s number of posts' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end
    scenario 'can see the post\'s title' do
      expect(page).to have_content(@post.title)
    end
    scenario 'can see the post\'s body' do
      expect(page).to have_content(@post.text)
    end
    scenario 'can see the post\'s number of comments' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end
    scenario 'redirects to the post\'s page when a post is clicked' do
      first('.link').click
      expect(page.current_path).to eql("/users/#{user.id}/posts/#{@post.id}")
    end
  end
end
