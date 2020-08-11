FactoryBot.define do
  factory :skill do
    association :side_job, factory: :side_job
    sequence(:name) { |n| "skill#{n}" }
    sequence(:importance_for_side_job) { |_n| '3' }
    sequence(:importance_for_main_job) { |_n| '3' }
  end
end
