require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'template has right placeholder text' do
      expect(response.body).to include(' These are all your users')
    end
  end

  describe 'GET /user' do
    before(:example) { get('/users/show') }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'template has right placeholder text' do
      expect(response.body).to include('Hi I am a specific user')
    end
  end
end
