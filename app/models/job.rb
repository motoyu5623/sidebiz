class Job < ApplicationRecord
  belongs_to :user

  # validates :user_id, presence: true

  validates :name, presence: true, length: { maximum: 50 }
  # validates :work_type, length: { maximum: 50 }
  # validates :section, length: { maximum: 50 }
  # validates :industry, length: { maximum: 50 }
  # validates :medium, length: { maximum: 50 }
  # validates :occupation, length: { maximum: 50 }
  validates :worktime_week, presence: true
  validates :description, presence: true, length: { maximum: 400 }
  # validates :pulled_skill, presence: true, length: { maximum: 400 }
  # validates :returned_skill, presence: true, length: { maximum: 400 }
  # validates :is_main, presence: true
end
