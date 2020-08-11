FactoryBot.define do
  factory :main_job do
    association :user
    name { 'WEBエンジニア' }
    work_type { '会社勤務' }
    company { '' }
    section { '開発部門' }
    industry { 'IT' }
    medium { '' }
    occupation { 'IT技術者' }
    started_at { '' }
    ended_at { '' }
    worktime_week { '〜5時間' }
    income_month { '〜1万円' }
    description { '新規アプリの開発と、既存アプリのメンテナンス' }
  end
end
