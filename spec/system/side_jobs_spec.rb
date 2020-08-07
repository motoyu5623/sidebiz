require 'rails_helper'

RSpec.describe 'SideJobs', type: :system do
  let!(:user) { create(:user) }
  let!(:main_job) { create(:main_job, user: user) }

  scenario "a user register side job" do
    login_as(user)
    visit root_path
    expect {
      click_link "レビュー投稿"
      visit new_side_job_path
      expect(current_path).to eq new_side_job_path
      expect(page).to have_content "副業レビューの投稿"
      fill_in 'side_job_name', with: "YouTuber"
      fill_in 'side_job_description', with: "動画撮影する"
      select 'WEBエンジニア', from: "side_job_main_job_id"

      
      fill_in 'side_job_description', with: "動画撮影する"
      fill_in 'side_job_skills_attributes_0_name', with: "ITの知識"
      select '5', from: "side_job_skills_attributes_0_importance_for_side_job"
      select '3', from: "side_job_skills_attributes_0_importance_for_main_job"

      fill_in 'side_job_skills_attributes_1_name', with: "継続力"
      select '5', from: "side_job_skills_attributes_1_importance_for_side_job"
      select '3', from: "side_job_skills_attributes_1_importance_for_main_job"

      fill_in 'side_job_skills_attributes_2_name', with: "メンタル"
      select '5', from: "side_job_skills_attributes_2_importance_for_side_job"
      select '3', from: "side_job_skills_attributes_2_importance_for_main_job"

      click_button "登録する"
      expect(current_path).to eq side_job_path(user.side_jobs.last)
      expect(page).to have_content "副業の登録に成功しました"
      expect(page).to have_content "YouTuber"
      expect(page).to have_content "動画撮影する"
      expect(page).to have_content "〜1万円"
      expect(page).to have_content "新規アプリの開発と、既存アプリのメンテナンス"
    }.to change(user.side_jobs, :count).by(1)

    expect {
      click_link "編集"
      expect(current_path).to eq edit_side_job_path(user.side_jobs.last)
      select '20〜30万円', from: "side_job_income_month"
      click_button "更新する"
      expect(current_path).to eq side_job_path(user.side_jobs.last)
      expect(page).to have_content "編集に成功しました"
      expect(page).to have_content "YouTuber"
      expect(page).to have_content "動画撮影する"
      expect(page).to have_content "20〜30万円"
      expect(page).to have_content "新規アプリの開発と、既存アプリのメンテナンス"
    }.to_not change(user.side_jobs, :count)

    expect {
      click_link "削除"
      expect(page).to have_content "削除しました"
    }.to change(user.side_jobs, :count).by(-1)
  end

end
