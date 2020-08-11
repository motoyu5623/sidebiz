require 'rails_helper'

RSpec.describe 'MainJobs', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:main_job) { create(:main_job, user: user) }

  describe '#new' do
    context 'as a logged in user' do
      it 'returns http success' do
        login_as(user)
        get new_main_job_path
        expect(response).to have_http_status(:success)
      end
    end
    context 'as not a logged in user' do
      it 'redirect to' do
        get new_main_job_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#create' do
    context 'as an authorized user' do
      it 'create a main job' do
        main_job_params = FactoryBot.attributes_for(:main_job, name: 'SIer')
        login_as(user)
        expect do
          post main_jobs_path, params: { main_job: main_job_params }
        end.to change(MainJob, :count).by(1)
      end
    end
    context 'as an unauthorized user' do
      it 'redirect to log in page' do
        main_job_params = FactoryBot.attributes_for(:main_job, name: 'SIer')
        post main_jobs_path, params: { main_job: main_job_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#edit' do
    it 'returns http success' do
      login_as(user)
      get edit_main_job_path(main_job)
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    context 'as an authorized user' do
      it 'update a main job' do
        main_job_params = FactoryBot.attributes_for(:main_job, name: 'コーダー')
        login_as(user)
        patch main_job_path(main_job), params: { id: main_job.id, main_job: main_job_params }
        expect(main_job.reload.name).to eq 'コーダー'
      end
    end

    context 'as an unauthorized user' do
      it 'does not update tha main job' do
        main_job_params = FactoryBot.attributes_for(:main_job, name: 'コーダー')
        login_as(other_user)
        patch main_job_path(main_job), params: { id: main_job.id, main_job: main_job_params }
        expect(main_job.reload.name).to eq 'WEBエンジニア'
      end
      it 'redirect to log in page' do
        main_job_params = FactoryBot.attributes_for(:main_job, name: 'TikToker')
        login_as(other_user)
        patch main_job_path(main_job), params: { id: main_job.id, main_job: main_job_params }
        expect(response).to redirect_to user_path(other_user)
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        main_job_params = FactoryBot.attributes_for(:main_job, name: 'コーダー')
        patch main_job_path(main_job), params: { id: main_job.id, main_job: main_job_params }
        expect(response).to have_http_status '302'
      end
      it 'redirects to log in page' do
        main_job_params = FactoryBot.attributes_for(:main_job, name: 'コーダー')
        patch main_job_path(main_job), params: { id: main_job.id, main_job: main_job_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#destroy' do
    context 'as an authorized user' do
      it 'deletes a main job' do
        login_as(user)
        expect do
          delete main_job_path(main_job), params: { id: main_job.id }
        end.to change(user.main_jobs, :count).by(-1)
      end
    end

    context 'as an unauthorized user' do
      it 'does not delete tha main job' do
        login_as(other_user)
        expect do
          delete main_job_path(main_job), params: { id: main_job.id }
        end.to_not change(MainJob, :count)
      end
      it 'redirects to log in page' do
        login_as(other_user)
        delete main_job_path(main_job), params: { id: main_job.id }
        expect(response).to redirect_to user_path(other_user)
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        delete main_job_path(main_job), params: { id: main_job.id }
        expect(response).to have_http_status '302'
      end
      it 'redirects to log in page' do
        delete main_job_path(main_job), params: { id: main_job.id }
        expect(response).to redirect_to new_user_session_path
      end
      it 'does not delete the main job' do
        expect do
          delete main_job_path(main_job), params: { id: main_job.id }
        end.to_not change(MainJob, :count)
      end
    end
  end
end
