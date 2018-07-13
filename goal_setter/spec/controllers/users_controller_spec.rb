require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'get#new' do
    it "renders new template" do
      get :new 
      expect(response).to render_template(:new)
    end
  end
  
  describe 'post#create' do
    context 'with valid params' do
      it "logs in the user" do
        post :create, params: {user: { email: 'email@email.com', password: '123456' }}
        user = User.find_by(email: 'email@email.com')
        expect(session[session_token]).to eq(user.session_token)
      end
      
      it "redirects to users show page" do
        post :create, params: {user: { email: 'email@email.com', password: '123456' }}
        expect(response).to render_template(user_path(user))
      end
    end
    
    context 'with invalid params' do
      it 'validates presense of password and renders template with appropriate errors' do
        post :create, params: {user: { email: 'email@email.com', password: '123' }}
        expect(response).to render_template(new_user)
        expect(flash[:errors]).to_not be_nil
      end
    end
  end

end
