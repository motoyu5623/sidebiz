class Skill < ApplicationRecord
  belongs_to :side_job
  validates :name, presence: true, length: { maximum: 50 }
end
