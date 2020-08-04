class Job < ApplicationRecord
  # belongs_to :user
  # has_many :skills, dependent: :destroy

  # has_many :job_skills, dependent: :destroy
  # has_many :skills, through: :job_skills

  # accepts_nested_attributes_for :skills, allow_destroy: true
  # accepts_nested_attributes_for :job_skills, allow_destroy: true

  validates :user_id, presence: true

  validates :name, presence: true, length: { maximum: 50 }
  # validates :work_type, length: { maximum: 50 }
  # validates :section, length: { maximum: 50 }
  # validates :industry, length: { maximum: 50 }
  # validates :medium, length: { maximum: 50 }
  # validates :occupation, length: { maximum: 50 }
  validates :worktime_week, presence: true
  validates :description, presence: true, length: { maximum: 400 }
end
