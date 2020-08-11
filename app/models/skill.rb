class Skill < ApplicationRecord
  belongs_to :side_job
  validates :name, presence: true, length: { maximum: 50 }
  validates :importance_for_side_job, presence: true
  validates :importance_for_main_job, presence: true
end
