require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject { user = User.create(username: 'bob', password: 'password')}

  describe UsersController do
    describe 'GET #index' do
      it 'renders index page' do
        get :index 
        expect(response).to render_template('index')
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #show' do
      it 'renders show page' do
        # User.create(username: 'bob', password: 'password')
        user = User.last
        get :show, params: { id: user.id }
        expect(response).to render_template(:show)
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #edit' do
      it 'renders edit page' do
        # user = User.create(username: 'bob', password: 'password')
        user = User.last
        get :edit, params: { id: user.id }
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #new' do
      it 'renders new page' do
        get :new
        expect(response).to render_template(:new)
        expect(response).to have_http_status(200)
      end
    end


    describe 'POST #create' do
      it 'with correct params creates user and shows their page' do
        # user = User.last
        post :create, params: { user: {username: 'bobby', password: 'password'} }
        user = User.last
        expect(response).to redirect_to(user_url(user.id))
      end

      it 'will fail with incorrect params and show errors' do
        post :create, params: { user: {username: 'bobbbo', password: 'pass'} }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

    describe 'PATCH #update' do
      user = User.last
      it 'with correct params updates user information and shows their page' do
        patch :update, params: { user: {username: 'bob', password: 'password1'} , id: user.id }
        expect(response).to redirect_to(user_url(user.id))
      end

      it 'will fail with incorrect params and show errors' do
        patch :update, params: { user: {username: 'bob', password: 'pass'} ,id: user.id}
        expect(response).to render_template(:edit)
        expect(flash[:errors]).to be_present
      end

    end
  end
end
