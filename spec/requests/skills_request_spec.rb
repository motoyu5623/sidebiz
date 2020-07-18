require 'rails_helper'

RSpec.describe 'Skills', type: :request do
  let!(:job) { create(:job) }

  describe 'GET /new' do
    it 'returns http success' do
      get new_job_skill_path(job)
      expect(response).to have_http_status(:success)
    end
  end
end
