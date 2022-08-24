require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
     before(:example) {  get('/users/1/posts') }  
    it "is a success" do
        expect(response).to have_http_status(:ok)
      end
      it "renders 'index' template" do
        expect(response).to render_template('posts/index')
      end
      it 'template has right placeholder text' do
        expect(response.body).to include(" These are all posts ")
       end
   
    end

    describe "GET /posts/show" do
        before(:example) { get('/users/1/posts/1') }  
       it "is a success" do
           expect(response).to have_http_status(:ok)
         end
         it "renders 'show' template" do
           expect(response).to render_template('show')
         end
         it 'template has right placeholder text' do
           expect(response.body).to include("Hi I am a specific user post ")
          end
      
       end
     
  end


# end
