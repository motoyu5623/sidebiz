class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :side_job

  validates :user_id, uniqueness: { scope: :side_job_id }
end
