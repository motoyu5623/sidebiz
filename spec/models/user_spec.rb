require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  it 'is valid with username, email, birtyday, password' do
    expect(user).to be_valid
  end

  it 'is invalid without username' do
    user.username = nil
    user.valid?
    expect(user.errors[:username]).to include("を入力してください")
  end

  it 'is invalid without email' do
    user.email = nil
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it 'is invalid with a duplicate email address' do
    other_user.email = user.email
    other_user.valid?
    expect(other_user.errors[:email]).to include("はすでに存在します")
  end
end
