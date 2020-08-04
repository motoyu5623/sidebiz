require 'rails_helper'

RSpec.describe 'SideJobs', type: :request do
  let!(:user) { create(:user) }
  let!(:main_job) { create(:main_job, user: user) }
  let!(:side_job) { create(:side_job, user: user, main_job: main_job) }

  describe 'GET /index' do
    it 'returns http success' do
      get side_jobs_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get side_job_path(side_job.id)
      expect(response).to have_http_status(:success)
    end
  end

  # Need to login  !!!!
  # describe 'GET /new' do
  #   it 'returns http success' do

  #     get new_:side_job_path
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /create' do
  #   it 'returns http success' do
  #     get '/:side_jobs/create'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /edit' do
  #   it 'returns http success' do
  #     get '/:side_jobs/edit'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /update' do
  #   it 'returns http success' do
  #     get '/:side_jobs/update'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /destroy' do
  #   it 'returns http success' do
  #     get '/:side_jobs/destroy'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
