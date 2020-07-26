class MainJob <  ApplicationRecord
  belongs_to :user, foreign_key:"user_id"
  has_many :side_jobs
end
