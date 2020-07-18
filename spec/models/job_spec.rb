require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:job) { create(:job) }
  # let(:user) { create(:user) }
  # let(:other_user) { create(:user) }

  it 'is valid with all valuable' do
    expect(job).to be_valid
  end

  it 'is invalid without name' do
    job.name = nil
    job.valid?
    expect(job.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without worktime' do
    job.worktime_week = nil
    job.valid?
    expect(job.errors[:worktime_week]).to include("can't be blank")
  end

  it 'is invalid without description' do
    job.description = nil
    job.valid?
    expect(job.errors[:description]).to include("can't be blank")
  end
end
