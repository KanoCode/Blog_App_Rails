require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      @author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.create(user_id: @author.id, title: 'Hello', text: 'This is my first post')
      @author.save
      # @post.save
      params = {
        post_id: 1,
        user_id: 1
      }
      post user_post_likes_path(params)
      expect(response).to have_http_status(:success)
    end
  end
end
