require './spec/rails_helper'

describe UsersController, type: :request do
  describe 'test for index method' do
    it 'should test for request status of root url' do
      get '/'
      expect(response).to have_http_status(:ok)
    end

    it 'should render index' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'should test for response body' do
      get '/'
      expect(response.body).to include('Welcome')
    end
  end

  describe 'test for show method' do
    before(:each) do
      get '/users/1'
    end
    it 'should test for request status of show method' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render show' do
      expect(response).to render_template(:show)
    end

    it 'should test for response body' do
      expect(response.body).to include('Name')
    end
  end
end
