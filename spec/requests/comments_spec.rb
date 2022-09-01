require 'rails_helper'

RSpec.describe 'Comments', type: :request do
 
  describe 'GET /new' do
    it 'returns http success' do
      get new_user_post_comment_path(1,1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get user_post_comments_path(1,1)
      expect(response).to have_http_status(:success)
    end
  end
end
