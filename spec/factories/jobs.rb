FactoryBot.define do
  factory :job do
    association :user
    name { 'WEBエンジニア' }
    work_type { '会社所属' }
    section { '開発部門' }
    industry { 'IT' }
    medium { '' }
    occupation { 'IT技術者' }
    started_at { '' }
    ended_at { '' }
    worktime_week { '45' }
    description { '新規アプリの開発と、既存アプリのメンテナンス' }
    pulled_skill { 'なし' }
    returned_skill { 'なし' }
    is_main { true }
  end
end
