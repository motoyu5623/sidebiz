class MainJob < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :side_jobs

  enum work_type: { '会社勤務' => 1, '個人事業(法人)' => 2, '個人事業(非法人)' => 3 }

  enum worktime_week: { '〜5時間' => 1, '5〜10時間' => 2, '10〜15時間' => 3, '15〜20時間' => 4, '20〜25時間' => 5, '25時間〜' => 6 }

  enum income_month: { '〜1万円' => 1, '1〜5万円' => 2, '5〜10万円' => 3, '10〜20万円' => 4, '20〜30万円' => 5, '30〜50万円' => 6, '50万円以上' => 7 }
end
