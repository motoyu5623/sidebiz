require 'rails_helper'

RSpec.describe 'Reaction', type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:main_job) { create(:main_job, user: user) }
  let!(:side_job) { create(:side_job, user: user, main_job: main_job) }

  scenario "stock and unstock from side job show page", js: true do
    login_as(other_user)
    visit side_job_path(side_job)
    expect(page).to have_css "span#stock_count_#{side_job.id}", text: '0'

    expect{
      find("a#js-stock-button-for-side-job-#{side_job.id}").click
      # click_link "ストック"
      expect(page).to have_css "span#stock_count_#{side_job.id}", text: '1'
    }.to change(Stock, :count).by(1)

    expect {
      find("a#js-stock-button-for-side-job-#{side_job.id}").click
      # click_link "ストック"
      expect(page).to have_css "span#stock_count_#{side_job.id}", text: '0'
    }.to change(Stock, :count).by(-1)
  end
  
  scenario "two users add comment" do
    login_as(other_user)
    visit side_job_path(side_job)
    fill_in 'comment_content', with: "良い組み合わせですね"
    expect {
      click_button "送信する"
      expect(current_path).to eq side_job_path(side_job)
      expect(page).to have_content "良い組み合わせですね"
    }.to change(other_user.comments, :count).by(1)

    login_as(user)
    visit side_job_path(side_job)
    fill_in 'comment_content', with: "コメントありがとうございます"
    expect {
      click_button "送信する"
      expect(current_path).to eq side_job_path(side_job)
      expect(page).to have_content "良い組み合わせですね"
      expect(page).to have_content "コメントありがとうございます"
    }.to change(user.comments, :count).by(1)
  end

end
