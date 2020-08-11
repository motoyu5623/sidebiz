FactoryBot.define do
  factory :stock do
    association :user
    association :side_job
  end
end
