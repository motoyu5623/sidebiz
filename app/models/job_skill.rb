class JobSkill < ApplicationRecord
  belongs_to :job
  belongs_to :skill
  validate :job_id, presence: true
  validate :skill_id, presence: true
end
