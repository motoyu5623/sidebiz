require 'rails_helper'

RSpec.describe 'Jobs', type: :request do
  let!(:job) { create(:job) }

  describe 'GET /index' do
    it 'returns http success' do
      get jobs_path(job)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get job_path(job)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_job_path
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'GET /create' do
  #   it 'returns http success' do
  #     get '/jobs/create'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /edit' do
  #   it 'returns http success' do
  #     get '/jobs/edit'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /update' do
  #   it 'returns http success' do
  #     get '/jobs/update'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /destroy' do
  #   it 'returns http success' do
  #     get '/jobs/destroy'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
