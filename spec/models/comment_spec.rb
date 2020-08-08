require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:side_job) { create(:side_job) }
  let(:user) { create(:user) }
  let(:comment) { create(:comment, user: user, side_job: side_job) }

  it 'is valid with all valuable' do
    expect(comment).to be_valid
  end

  it 'is invalid without content' do
    comment.content = nil
    comment.valid?
    expect(comment.errors[:content]).to include("を入力してください")
  end

  it 'is invalid without user' do
    comment.user = nil
    comment.valid?
    expect(comment.errors[:user]).to include("を入力してください")
  end
  
  it 'is invalid without side_job' do
    comment.side_job = nil
    comment.valid?
    expect(comment.errors[:side_job]).to include("を入力してください")
  end
end
