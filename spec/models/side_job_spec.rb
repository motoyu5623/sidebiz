require 'rails_helper'

RSpec.describe SideJob, type: :model do
  let(:side_job) { create(:side_job) }
  let(:user) { create(:user) }
  # let(:other_user) { create(:user) }

  it 'is valid with all valuable' do
    expect(side_job).to be_valid
  end

  it 'is invalid without name' do
    side_job.name = nil
    side_job.valid?
    expect(side_job.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without worktime' do
    side_job.worktime_week = nil
    side_job.valid?
    expect(side_job.errors[:worktime_week]).to include("can't be blank")
  end

  it 'is invalid without description' do
    side_job.description = nil
    side_job.valid?
    expect(side_job.errors[:description]).to include("can't be blank")
  end
end
