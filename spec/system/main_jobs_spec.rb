require 'rails_helper'

RSpec.describe 'MainJobs', type: :system do
  let!(:user) { create(:user) }
  # let!(:main_job) { create(:main_job, user: user) }

  scenario "a user register main job" do
    login_as(user)
    visit root_path
    expect {
      click_link "レビュー投稿"
      expect(current_path).to eq new_main_job_path
      expect(page).to have_content ""
      fill_in 'main_job_name', with: "WEBエンジニア"
      click_button "登録する"
      expect(current_path).to eq user_path(user)
      expect(page).to have_content "#{user.username}のページ"
      expect(page).to have_content "WEBエンジニア"
      expect(page).to have_content "本業の追加登録"
      expect(page).to have_content "アカウント編集"
    }.to change(user.main_jobs, :count).by(1)
  end

end
