require 'rails_helper'

RSpec.describe 'MainJobs', type: :system do
  let!(:user) { create(:user) }
  # let!(:main_job) { create(:main_job, user: user) }

  scenario 'a user register main job' do
    login_as(user)
    visit root_path
    expect do
      click_link 'レビュー投稿'
      expect(current_path).to eq new_main_job_path
      expect(page).to have_content '本業情報の登録'
      fill_in 'main_job_name', with: 'WEBエンジニア'
      click_button '登録する'
      expect(current_path).to eq user_path(user)
      expect(page).to have_content "#{user.username}のページ"
      expect(page).to have_content 'WEBエンジニア'
      expect(page).to have_content '本業の追加登録'
      expect(page).to have_content 'アカウント編集'
    end.to change(user.main_jobs, :count).by(1)

    expect do
      visit edit_main_job_path(user.main_jobs.last)
      expect(current_path).to eq edit_main_job_path(user.main_jobs.last)
      select '20〜30万円', from: 'main_job_income_month'
      click_button '更新する'
      expect(current_path).to eq user_path(user)
      expect(page).to have_content '編集に成功しました'
    end.to_not change(user.main_jobs, :count)

    expect do
      visit edit_main_job_path(user.main_jobs.last)
      click_link '削除'
      expect(page).to have_content '削除しました'
    end.to change(user.main_jobs, :count).by(-1)
  end
end
