class Job < ApplicationRecord
  belongs_to :user

  has_many :job_skills, dependent: :destroy
  has_many :skills, through: :job_skills

  accepts_nested_attributes_for :skills, allow_destroy: true
  accepts_nested_attributes_for :job_skills, allow_destroy: true

  validates :user_id, presence: true

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

  # def save_skills(tags)
  #   current_tags = skills.pluck(:name) unless skills.nil?
  #   old_tags = curernt_tags - tags
  #   new_tags = tags - current_tags

  #   old_tags.each do |old_name|
  #     skills.delete Skill.find_by(name: old_name)
  #   end

  #   new_tags.each do |new_name|
  #     job_skill = Skill.find_or_create_by(name: new_name)
  #     skills << job_skill
  #   end
  # end
end
