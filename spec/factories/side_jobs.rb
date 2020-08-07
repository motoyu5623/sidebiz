FactoryBot.define do
  factory :side_job do
    association :user
    association :main_job
    name { 'YouTuber' }
    work_type { '会社勤務' }
    section { '' }
    industry { 'IT' }
    medium { '' }
    occupation { 'IT' }
    started_at { '' }
    ended_at { '' }
    worktime_week { '〜5時間' }
    income_month { '〜1万円' }
    description { '動画撮影する' }
    pulled_skill { 'なし' }
    returned_skill { 'なし' }
  end
end
