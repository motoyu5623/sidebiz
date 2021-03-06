require 'rails_helper'

RSpec.describe SideJob, type: :model do
  let(:side_job) { create(:side_job) }
  let(:user) { create(:user) }

  it 'is valid with all valuable' do
    expect(side_job).to be_valid
  end

  it 'is invalid without name' do
    side_job.name = nil
    side_job.valid?
    expect(side_job.errors[:name]).to include('を入力してください')
  end

  it 'is invalid without description' do
    side_job.description = nil
    side_job.valid?
    expect(side_job.errors[:description]).to include('を入力してください')
  end

  it 'is invalid without income_month' do
    side_job.income_month = nil
    side_job.valid?
    expect(side_job.errors[:income_month]).to include('を入力してください')
  end

  it 'is invalid without worktime_week' do
    side_job.worktime_week = nil
    side_job.valid?
    expect(side_job.errors[:worktime_week]).to include('を入力してください')
  end

  it 'is invalid without main_job' do
    side_job.main_job = nil
    side_job.valid?
    expect(side_job.errors[:main_job]).to include('を入力してください')
  end
end
