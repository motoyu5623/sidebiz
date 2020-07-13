require 'rails_helper'

RSpec.describe 'MainJobs', type: :request do
  let!(:user) { create(:user) }

  describe 'GET /new' do
    it 'returns http success' do
      login_as(user)
      get '/main_job/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/main_job/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
