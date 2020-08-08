require 'rails_helper'

RSpec.describe 'SideJobs', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:main_job) { create(:main_job, user: user) }
  let!(:side_job) { create(:side_job, user: user, main_job: main_job) }
  let!(:skill) { create(:skill, side_job: side_job) }

  describe '#index' do
    it 'returns http success' do
      get side_jobs_path
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    it 'returns http success' do
      get side_job_path(side_job)
      expect(response).to have_http_status(:success)
    end
  end

  describe '#new' do
    context 'as a logged in user' do
      it 'returns http success' do
        login_as(user)
        get new_side_job_path
        expect(response).to have_http_status(:success)
      end
    end
    context 'as not a logged in user' do
      it 'redirect to' do
        get new_side_job_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#create' do
    context 'as an authorized user' do
      it 'create a side job' do
        side_job_params = FactoryBot.attributes_for(:side_job, main_job_id: main_job.id).merge({skills: [attributes_for(:skill)]})
        login_as(user)
        expect {
          post side_jobs_path, params: { side_job: side_job_params }
        }.to change(SideJob, :count).by(1)
      end
    end
    context 'as an unauthorized user' do
      it 'redirect to log in page' do
        side_job_params = FactoryBot.attributes_for(:side_job)
        post side_jobs_path, params: {side_job: side_job_params}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#edit' do
    it 'returns http success' do
      login_as(user)
      get edit_side_job_path(side_job)
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    context 'as an authorized user' do
      it 'update a side job' do
        side_job_params = FactoryBot.attributes_for(:side_job, name: 'TikToker').merge({skills: [attributes_for(:skill)]})
        login_as(user)
        patch side_job_path(side_job), params: { id: side_job.id, side_job: side_job_params}
        expect(side_job.reload.name).to eq 'TikToker'
      end
    end
    context 'as an unauthorized user' do
      it 'does not update tha side job' do
        side_job_params = FactoryBot.attributes_for(:side_job, name: 'TikToker').merge({skills: [attributes_for(:skill)]})
        login_as(other_user)
        patch side_job_path(side_job), params: { id: side_job.id, side_job: side_job_params}
        expect(side_job.reload.name).to eq 'YouTuber'
      end

      it 'redirect to log in page' do
        side_job_params = FactoryBot.attributes_for(:side_job, name: 'TikToker').merge({skills: [attributes_for(:skill)]})
        login_as(other_user)
        patch side_job_path(side_job), params: { id: side_job.id, side_job: side_job_params}
        expect(response).to redirect_to side_job_path(side_job)
      end
    end
    context 'as a guest' do
      it 'returns a 302 response' do
        side_job_params = FactoryBot.attributes_for(:side_job, name: 'TikToker').merge({skills: [attributes_for(:skill)]})
        patch side_job_path(side_job), params: { id: side_job.id, side_job: side_job_params}
        expect(response).to have_http_status '302'
      end
      it 'redirects to log in page' do
        side_job_params = FactoryBot.attributes_for(:side_job, name: 'TikToker').merge({skills: [attributes_for(:skill)]})
        patch side_job_path(side_job), params: { id: side_job.id, side_job: side_job_params}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#destroy' do
    context 'as an authorized user' do
      it 'deletes a side job' do
        login_as(user)
        expect {
          delete side_job_path(side_job), params: { id: side_job.id }
        }.to change(user.side_jobs, :count).by(-1)
      end
    end
    context 'as an unauthorized user' do
      it 'does not delete tha side job' do
        login_as(other_user)
        expect {
          delete side_job_path(side_job), params: { id: side_job.id }
        }.to_not change(SideJob, :count)
      end
      it 'redirects to log in page' do
        login_as(other_user)
        delete side_job_path(side_job), params: { id: side_job.id }
        expect(response).to redirect_to side_job_path(side_job)
      end
    end
    context 'as a guest' do
      it 'returns a 302 response' do
        delete side_job_path(side_job), params: { id: side_job.id }
        expect(response).to have_http_status '302'
      end
      it 'redirects to log in page' do
        delete side_job_path(side_job), params: { id: side_job.id }
        expect(response).to redirect_to new_user_session_path
      end
      it 'does not delete the side job' do
        expect {
          delete side_job_path(side_job), params: { id: side_job.id }
        }.to_not change(SideJob, :count)
      end
    end
    
  end
end
