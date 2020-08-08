require 'rails_helper'

RSpec.describe MainJob, type: :model do
  let(:main_job) { create(:main_job) }
  let(:user) { create(:user) }

  it 'is valid with all valuable' do
    expect(main_job).to be_valid
  end

  it 'is invalid without name' do
    main_job.name = nil
    main_job.valid?
    expect(main_job.errors[:name]).to include("を入力してください")
  end

  it 'is invalid without income_month' do
    main_job.income_month = nil
    main_job.valid?
    expect(main_job.errors[:income_month]).to include("を入力してください")
  end

  it 'is invalid without worktime_week' do
    main_job.worktime_week = nil
    main_job.valid?
    expect(main_job.errors[:worktime_week]).to include("を入力してください")
  end
end
