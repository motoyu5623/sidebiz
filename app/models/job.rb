class Job < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :type, length: { maximum: 50 }
  validates :section
  validates :industry
  validates :medium
  validates :occupation, length: { maximum: 50 }
  validates :started_at
  validates :ended_at
  validates :worktime_week, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :pulled_skill, presence: true, length: { maximum: 200 }
  validates :returned_skill, presence: true, length: { maximum: 200 }
  validates :is_main
end
