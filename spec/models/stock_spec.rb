require 'rails_helper'

RSpec.describe Stock, type: :model do
  let(:side_job) { create(:side_job) }
  let(:user) { create(:user) }
  let(:stock) { create(:stock, user: user, side_job: side_job) }

  it 'is valid with all valuable' do
    expect(stock).to be_valid
  end

  it 'is invalid without user' do
    stock.user = nil
    stock.valid?
    expect(stock.errors[:user]).to include("を入力してください")
  end

  it 'is invalid without side_job' do
    stock.side_job = nil
    stock.valid?
    expect(stock.errors[:side_job]).to include("を入力してください")
  end
end
