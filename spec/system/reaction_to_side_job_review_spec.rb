require 'rails_helper'

RSpec.describe 'Reaction', type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:main_job) { create(:main_job, user: user) }
  let!(:side_job) { create(:side_job, user: user, main_job: main_job) }

  scenario 'stock and unstock from side job show page', js: true do
    login_as(other_user)
    visit side_job_path(side_job)
    expect(page).to have_css "span#stock_count_#{side_job.id}", text: '0'

    expect do
      find("a#js-stock-button-for-side-job-#{side_job.id}").click
      expect(page).to have_css "span#stock_count_#{side_job.id}", text: '1'
    end.to change(Stock, :count).by(1)

    expect do
      find("a#js-stock-button-for-side-job-#{side_job.id}").click
      expect(page).to have_css "span#stock_count_#{side_job.id}", text: '0'
    end.to change(Stock, :count).by(-1)
  end

  scenario 'two users add comment', js: true do
    login_as(other_user)
    visit side_job_path(side_job)
    fill_in 'comment_content', with: '良い組み合わせですね'
    expect do
      click_button '送信する'
      expect(current_path).to eq side_job_path(side_job)
      expect(page).to have_content '良い組み合わせですね'
    end.to change(other_user.comments, :count).by(1)

    login_as(user)
    visit side_job_path(side_job)
    fill_in 'comment_content', with: 'コメントありがとうございます'
    expect do
      click_button '送信する'
      expect(current_path).to eq side_job_path(side_job)
      expect(page).to have_content '良い組み合わせですね'
      expect(page).to have_content 'コメントありがとうございます'
    end.to change(user.comments, :count).by(1)
  end
end
