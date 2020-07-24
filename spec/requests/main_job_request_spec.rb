require 'rails_helper'

RSpec.describe 'MainJobs', type: :request do
  let!(:user) { create(:user) }
  let!(:job) { create(:job, user: user) }
  let!(:main_job) { create(:job, :main_job, user: user) }

  describe 'GET /new' do
    it 'returns http success' do
      login_as(user)
      get new_main_job_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      login_as(user)
      get edit_main_job_path(main_job.id)
      expect(response).to have_http_status(:success)
    end
  end
end
