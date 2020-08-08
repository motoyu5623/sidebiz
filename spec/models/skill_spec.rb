require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:side_job) { create(:side_job) }
  let(:user) { create(:user) }
  let(:skill) { create(:skill, side_job: side_job) }

  it 'is valid with all valuable' do
    expect(skill).to be_valid
  end

  it 'is invalid without name' do
    skill.name = nil
    skill.valid?
    expect(skill.errors[:name]).to include("を入力してください")
  end

  it 'is invalid without importance_for_side_job' do
    skill.importance_for_side_job = nil
    skill.valid?
    expect(skill.errors[:importance_for_side_job]).to include("を入力してください")
  end

  it 'is invalid without importance_for_main_job' do
    skill.importance_for_main_job = nil
    skill.valid?
    expect(skill.errors[:importance_for_main_job]).to include("を入力してください")
  end
end
