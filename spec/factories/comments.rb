FactoryBot.define do
  factory :comment do
    content { '初コメントしてみた' }
    association :user
    association :side_job
  end
end
